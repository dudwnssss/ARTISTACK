//
//  LoginButton.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit

class LoginButton: UIButton {

    var loginType : AccountType?
    
    init(loginType: AccountType){
        self.loginType = loginType
        super.init(frame: .zero)
        setProperties()
    }
    
    func setProperties(){
        var configuration = UIButton.Configuration.plain()
        configuration.imagePadding = 30
        configuration.imagePlacement = .leading
        switch loginType{
        case .kakao:
            configuration.title = "카카오톡으로 시작하기"
            configuration.image = Image.kakao
            configuration.background.backgroundColor = UIColor(hex: "#FAE300")
        case .apple:
            var attString = AttributedString.init("Apple로 시작하기")
            attString.font = Font.bold16
            attString.foregroundColor = Color.black
            configuration.attributedTitle = attString
            configuration.image = Image.apple
            configuration.background.backgroundColor = Color.artistackSystem8
        default:
            break
        }
        self.configuration = configuration
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
