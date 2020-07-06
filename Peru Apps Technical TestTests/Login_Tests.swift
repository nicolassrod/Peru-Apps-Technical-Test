//
//  Login.swift
//  Peru Apps Technical TestTests
//
//  Created by Nicolás A. Rodríguez on 7/4/20.
//

import XCTest
import Combine
@testable import Peru_Apps_Technical_Test

class Login_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Repositories
    func LoginRepository() throws {
        // This is an example of a functional test case.
        var repository: LoginRepository = LoginRepository()
        repository.login(with: "peruapps0@peruapps.com", password: "password0")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
