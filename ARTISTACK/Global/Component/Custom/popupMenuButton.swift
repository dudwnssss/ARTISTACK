////
////  popupMenu.swift
////  ARTISTACK
////
////  Created by 임영준 on 2023/08/26.
////
//
//import UIKit
//
//class popupMenuButton: UIButton {
//    
//    let share = UIAction(title: "공유하기", image: UIImage(named: "share")) { _ in
//        print("share")
//    }
//    let report = UIAction(title: "신고하기", image: UIImage(named: "report")) { _ in
//        print("report")
//    }
//    let delete = UIAction(title: "삭제하기", image: UIImage(named: "delete")) { _ in
//        print("delete")
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setProperties()
//    }
//    
//    func setProperties(){
//        setImage(UIImage(named: "others"), for: .normal)
//        menu = UIMenu(children: [share, report, delete])
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
