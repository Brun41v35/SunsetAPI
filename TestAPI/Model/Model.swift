//
//  Model.swift
//  TestAPI
//
//  Created by Bruno Silva on 10/11/20.
//

import Foundation

struct Resposta: Codable {
    var results: InfoResults
    var status: String
}

struct InfoResults: Codable {
    var sunrise: String
    var sunset: String
    var solar_noon: String
}
