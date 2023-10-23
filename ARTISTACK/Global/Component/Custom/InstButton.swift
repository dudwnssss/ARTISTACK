//
//  InstButton.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/26.
//

import UIKit

enum InstType: Int, CaseIterable {
    case piano
    case guitar
    case bass
    case drum
    case vocal
    case others
    
    var title: String {
        switch self {
        case .piano:
            return "피아노"
        case .guitar:
            return "기타"
        case .bass:
            return "베이스"
        case .drum:
            return "드럼"
        case .vocal:
            return "보컬"
        case .others:
            return "그외 악기"
        }
    }
    
    var instImage: UIImage {
        switch self {
        case .piano:
            return UIImage(named: "piano")!
        case .guitar:
            return UIImage(named: "guitar")!
        case .bass:
            return UIImage(named: "bass")!
        case .drum:
            return UIImage(named: "drum")!
        case .vocal:
            return UIImage(named: "vocal")!
        case .others:
            return UIImage(named: "etc")!
        }
    }
}

class InstButton: UIButton {
    var instType: InstType?
    var isTapped = false {
        didSet{
            configureButton()
        }
    }
    

    let instTitleLabel = UILabel()
    let instImageView = UIImageView()
    
    convenience init(type: InstType){
        self.init(frame: .zero)
        instType = type
        setProperties()
        setLayouts()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(){
        cornerRadius = 5
        borderWidth = 0.5
        configureButton()
        instTitleLabel.text = instType?.title
        instImageView.image = instType?.instImage
    }
    
    func setLayouts(){
        addSubviews(instTitleLabel, instImageView)

        snp.makeConstraints {
            $0.height.equalTo(self.snp.width)
        }
        instTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-10)
        }
        instImageView.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.bottom.equalTo(instTitleLabel.snp.top)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    func configureButton(){
        switch isTapped{
        case true:
            borderColor = Color.artistackSystem5
            backgroundColor = Color.artistackSystem2
            instTitleLabel.font = Font.bold13
            instTitleLabel.textColor = Color.artistackSystem6
        case false:
            borderColor = Color.artistackSystem4
            backgroundColor = Color.artistackSystem1
            instTitleLabel.font = Font.medium13
            instTitleLabel.textColor = Color.artistackSystem5
        }
    }
}
