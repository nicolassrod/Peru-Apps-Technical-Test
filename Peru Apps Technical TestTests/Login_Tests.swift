//
//  Login.swift
//  Peru Apps Technical TestTests
//
//  Created by Nicolás A. Rodríguez on 7/4/20.
//

import XCTest
import Foundation
import Combine

@testable import Peru_Apps_Technical_Test

final class Login_Tests: XCTestCase {
    var repository: LoginRepositoryProtocol!
    var cancelables = Set<AnyCancellable>()
    
    override func setUp() {
        self.repository = LoginRepository()
    }
    
    override func tearDown() {
        self.repository = nil
    }
    
    // Repositories
    func login_Test() throws {
        let expectation = self.expectation(description: "login callback")
        
        repository.loginWith(email: "peruapps0@peruapps.com", password: "password0")
            .sink { completion in
                print("Finish")
            } receiveValue: { value in
                XCTAssertEqual(201, value.status)
                expectation.fulfill()
            }.store(in: &cancelables)
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
