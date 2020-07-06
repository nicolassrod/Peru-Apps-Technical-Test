//
//  LoginRepository.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/4/20.
//

import Foundation
import Combine
import KeychainSwift

struct LoginRepository: LoginRepositoryProtocol {
    func loginWith(email: String, password: String) -> AnyPublisher<UserLoginResponse, Error> {
        var urlRequest = URLRequest(url: URL(string: "http://api-movies.pappstest.com/api/v1/auth/login")!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let user = User(email: email, password: password)
        let data = try! JSONEncoder().encode(user)
        urlRequest.httpBody = data
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError { $0 as Error }
            .map { $0.data }
            .decode(type: UserLoginResponse.self, decoder: JSONDecoder.init())
            .eraseToAnyPublisher()
    }
    
    func save(token: String) -> Bool {
        let keychain = KeychainSwift()
        return keychain.set(token, forKey: "bearer-token")
    }
    
    func getToken() -> String {
        let keychain = KeychainSwift()
        let data = keychain.getData("bearer-token")
        return String(data: data!, encoding: .utf8)!
    }
}
