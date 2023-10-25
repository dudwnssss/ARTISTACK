//
//  PostCell.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit
import AVFoundation


enum stackCount: Int, CaseIterable {
    case one = 1
    case two
    case three
    case four
    case five
    case six
    
    var height: Int {
        switch self{
        case .one:
            return 60
        case .two:
            return 120
        case .three:
            return 180
        case .four:
            return 180
        case .five:
            return 180
        case .six:
            return 180
        }
    }
}

protocol CodeButtonDelegate {
    func codeButtonDidTap(showHeader: Bool)
}

final class PostCell: UITableViewCell{
        
    let playerView = VideoPlayerView()
    
    var delegateCodeButton: CodeButtonDelegate?
    
    let codePopupView = CodePopupView()
    
    let count: stackCount = .three
    
    let contentBackgroundView = UIView().then{
        $0.backgroundColor = .systemMint
    }
    
    let darkBackgroundImageView = UIImageView().then{
        $0.image = Image.backgroundDarkBottom
        $0.contentMode = .scaleAspectFill
    }
    
    lazy var userTableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.rowHeight = 55
        $0.register(cell: UserCell.self)
        $0.delegate = self
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
    }
    let codeButton = UIButton().then{
        $0.setImage(Image.code, for: .normal)
    }
    let likeButton = UIButton().then{
        $0.setImage(Image.like, for: .normal)
    }
    let likeCountLabel = UILabel().then{
        $0.text = "34"
        $0.font = Font.bold15
        
    }
    let stackButton = UIButton().then{
        $0.setImage(Image.stack, for: .normal)
    }
    let stackCountLabel = UILabel().then{
        $0.text = "5"
        $0.font = Font.bold15
    }
    let titleLabel = UILabel().then{
        $0.text = "오랜만에 피아노"
        $0.font = Font.bold16

    }
    let descriptionLabel = UILabel().then{
        $0.text = "오랜만에피아노라서약간어색하네요최대최대글자수입최대최대최대최대최대최대글자수입니다최대최대최대"
        $0.numberOfLines = 0
        $0.font = Font.bold14
        $0.isHidden = true

    }
    let infoStackView = UIStackView().then{
        $0.spacing = 10
        $0.alignment = .leading
        $0.axis = .vertical
        $0.distribution = .fill
    }
    let othersButton = UIButton().then{
        $0.setImage(Image.others, for: .normal)
    }
    let moreButton = UIButton().then{
        $0.setTitle("더보기", for: .normal)
        $0.titleLabel?.font = Font.bold14
    }
    
    let shareButton = popupContentButton().then{
        $0.popupTitleLabel.text = "프로필로 이동"
        $0.iconImageView.image = Image.share
    }
    let reportButton = popupContentButton().then{
        $0.popupTitleLabel.text = "신고하기"
        $0.iconImageView.image = Image.report
    }
    let deleteButton = popupContentButton().then{
        $0.popupTitleLabel.text = "삭제하기"
        $0.iconImageView.image = Image.delete
    }
    
    let popupStackView = UIStackView().then{
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .fill
        $0.layer.backgroundColor = (Color.artistackSystem1.cgColor).copy(alpha: 0.95)
        $0.layer.cornerRadius = 5
        $0.isHidden = true
    }
    
    let separator1View = SeparatorView( inset: 5)
    let separator2View = SeparatorView( inset: 5)
    
    override func prepareForReuse() {
        super.prepareForReuse()
        popupStackView.isHidden = true
        descriptionLabel.isHidden = true
        codePopupView.isHidden = true
        codeButton.setImage(Image.code, for: .normal)
        playerView.cancelAllLoadingRequest()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayouts()
        setProperties()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        }
        catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayouts() {
        
        contentView.addSubviews(playerView, darkBackgroundImageView, othersButton, stackButton, stackCountLabel, likeButton, likeCountLabel, codeButton, infoStackView, moreButton, userTableView, popupStackView, codePopupView)
        
        playerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        //todo
        darkBackgroundImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        
        infoStackView.addArrangedSubviews(titleLabel, descriptionLabel)
        othersButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-8)
            $0.bottom.equalToSuperview().offset(-10)
        }
        stackCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(othersButton.snp.top)
            $0.centerX.equalTo(othersButton)
        }
        stackButton.snp.makeConstraints {
            $0.bottom.equalTo(stackCountLabel.snp.top).offset(4)
            $0.centerX.equalTo(othersButton)
        }
        likeCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(stackButton.snp.top)
            $0.centerX.equalTo(othersButton)
        }
        likeButton.snp.makeConstraints {
            $0.bottom.equalTo(likeCountLabel.snp.top).offset(4)
            $0.centerX.equalTo(othersButton)
        }
        codeButton.snp.makeConstraints {
            $0.bottom.equalTo(likeButton.snp.top)
            $0.centerX.equalTo(othersButton)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(userTableView.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.lessThanOrEqualTo(othersButton.snp.leading).offset(-10)
        }
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        moreButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(12)
            $0.centerY.equalTo(titleLabel)
        }
        
        userTableView.snp.makeConstraints {
            $0.leading.equalTo(infoStackView)
            $0.trailing.equalTo(moreButton.snp.trailing).offset(80)
            $0.height.equalTo(count.height)
            $0.bottom.equalTo(titleLabel.snp.top).offset(-20)
        }
        popupStackView.addArrangedSubviews(shareButton, separator1View, reportButton, separator2View, deleteButton)
        
        popupStackView.snp.makeConstraints {
            $0.trailing.equalTo(othersButton.snp.trailing)
            $0.width.equalToSuperview().multipliedBy(0.45)
            $0.bottom.equalTo(othersButton.snp.top)
        }
        
        codePopupView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
    }
    func setProperties(){
        backgroundColor = .black
        codePopupView.isHidden = true
        moreButton.addTarget(self, action: #selector(moreButtonDidTap), for: .touchUpInside)
        othersButton.addTarget(self, action: #selector(othersButtonDidTap), for: .touchUpInside)
        codeButton.addTarget(self, action: #selector(codeButtonDidTap), for: .touchUpInside)
    }
    

    
    //확장됐는지 아닌지 상태를 저장하고 있어야함
    @objc func moreButtonDidTap(){
        descriptionLabel.isHidden.toggle()
        contentView.layoutIfNeeded()
    }
    
    
    @objc func othersButtonDidTap(){
        popupStackView.isHidden.toggle()
    }
    
    @objc func codeButtonDidTap(){
        codePopupView.isHidden.toggle()
        codePopupView.isHidden ? codeButton.setImage(Image.code, for: .normal) : codeButton.setImage(Image.codeFill, for: .normal)
        delegateCodeButton?.codeButtonDidTap(showHeader: codePopupView.isHidden)
    }
    
    func configureCell(project: Project){
        likeCountLabel.text = "\(project.likeCount)"
        stackCountLabel.text = "\(project.stackCount)"
        titleLabel.text = project.title
        descriptionLabel.text = project.description
        codePopupView.bpmLabel.text = project.bpm
        codePopupView.codeLabel.text = project.codeFlow
    }
    

}

extension PostCell: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.lineImageView.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count.rawValue
    }
    
    
}
