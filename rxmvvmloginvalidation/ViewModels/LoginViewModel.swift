//
//  LoginViewModel.swift
//  rxmvvmloginvalidation
//
//  Created by 신동규 on 2021/01/10.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    // MARK: Properties
    let idPublishSubject = PublishSubject<String>()
    let pwPublishSubject = PublishSubject<String>()
    
    
    func loginValidator() -> Observable<Bool> {
        return Observable.combineLatest(idPublishSubject.asObservable(), pwPublishSubject.asObservable()).map { username, password in
            return username.count > 3 && password.count > 3
        }
    }
}
