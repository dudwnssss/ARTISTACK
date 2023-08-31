//
//  recordUtilButton.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

enum TimerType: Int, CaseIterable{
    case none = 0
    case three = 3
    case five = 5
    case ten = 10
    
    var timerImage : UIImage{
        switch self {
        case .none:
            return UIImage(named: "timer")!
        case .three:
            return UIImage(named: "timer")!
        case .five:
            return UIImage(named: "timer")!
        case .ten:
            return UIImage(named: "timer")!
        }
    }
}

enum UtilType: CaseIterable {
    case timer
    case camera
    case volume
    case retake
    case replay
    
    var utilTitle: String {
        switch self {
        case .timer:
            return "타이머"
        case .camera:
            return "화면전환"
        case .volume:
            return "볼륨조절"
        case .retake:
            return  "재촬영"
        case .replay:
            return "다시재생"
        }
        
    }
    var utilImage: UIImage {
        switch self {
        case .timer:
            return UIImage(named: "timer")!
        case .camera:
            return UIImage(named: "transition")!
        case .volume:
            return UIImage(named: "volume")!
        case .retake:
            return UIImage(named: "retake")!
        case .replay:
            return UIImage(named: "replay")!
        }
    }
}

class RecordUtilButton: UIButton {
    var utilType: UtilType?
    let utilTitleLabel = UILabel().then{
        $0.text = "temp"
        $0.font = .boldSystemFont(ofSize: 11)
    }
    let utilImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    convenience init(utilType: UtilType){
        self.init(frame: .zero)
        self.utilType = utilType
        setProperties()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(){
        utilImageView.image = utilType?.utilImage
        utilTitleLabel.text = utilType?.utilTitle
    }
    
    func setLayouts(){
        addSubviews(utilImageView, utilTitleLabel)
        snp.makeConstraints {
            $0.width.equalTo(52)
            $0.height.equalTo(60)
        }
        utilTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        utilImageView.snp.makeConstraints {
            $0.size.equalTo(42)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(utilTitleLabel.snp.top).offset(-2)
        }
    }
}
