//
//  UserLoginResponse.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/5/20.
//

import Foundation

struct UserLoginResponse: Codable {
    var status: Int
    var data: ResponseData
}

struct ResponseData: Codable {
    var token: String
}
