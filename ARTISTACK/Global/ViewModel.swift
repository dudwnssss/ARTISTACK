//
//  ViewModel.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/11/07.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
}
