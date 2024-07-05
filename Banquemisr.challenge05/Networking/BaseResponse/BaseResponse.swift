//
//  BaseResponse.swift
//  App
//
//  Created by Mohamed Aglan on 5/07/2024.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    var key: ServerResponseKey
    var message: String
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case key
        case message = "msg"
        case data
    }
    
}
