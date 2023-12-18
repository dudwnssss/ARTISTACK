//
//  ViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/11/07.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
        
    func transform(input: Input) -> Output
}
