//
//  LoginRepository.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/3/20.
//

import Foundation
import Combine

protocol LoginRepositoryProtocol {
    func loginWith(email: String, password: String) -> AnyPublisher<UserLoginResponse, Error>
    func logOut()
    func save(token: String) -> Bool
    func getToken() -> String
}
