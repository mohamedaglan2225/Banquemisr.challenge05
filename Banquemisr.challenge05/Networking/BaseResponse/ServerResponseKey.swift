//
//  ServerResponseKey.swift
//  App
//
//  Created by Mohamed Aglan on 5/07/2024.
//

import Foundation

enum ServerResponseKey: String, Decodable {
    case success
    case fail
    case unauthenticated = "unauthorized"
    case needActive
    case exception
    case blocked
}
