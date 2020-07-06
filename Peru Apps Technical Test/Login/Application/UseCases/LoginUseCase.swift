//
//  LoginUseCase.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/3/20.
//

import Foundation
import Combine

struct LoginUseCase {
    let repository: LoginRepositoryProtocol
    
    func loginWith(email: String, password: String) -> AnyPublisher<UserLoginResponse, Error>  {
        repository.loginWith(email: email, password: password)
    }
    
    func save(token: String) -> Bool{
        repository.save(token: token)
    }
    
    func logOut() {
        repository.logOut()
    }
}
