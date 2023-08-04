//
//  File.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit

final class UserCell: UITableViewCell {
    
    let backgroundImageView = UIImageView().then{
        $0.image = UIImage(named: "background.gradient")
    }
    let profileImageView = UIImageView()
    let instImageView = UIImageView()
    let nicknameLabel = UILabel()
    let lineImageView = UIImageView()
    
}
