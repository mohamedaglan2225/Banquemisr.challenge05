//
//  NetworkConstants.swift
//  App
//
//  Created by Mohamed Aglan on 5/07/2024.
//

import Foundation

struct NetworkConstants {
    private init() {}
    static let domain = "https://api.themoviedb.org"
    static var server: String {
        return domain + "/api/"
    }
}
