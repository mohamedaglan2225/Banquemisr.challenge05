//
//  NetworkReachability.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/7/24.
//

import Alamofire

struct NetworkReachability {
    static let shared = NetworkReachability()
    
    private let reachabilityManager = NetworkReachabilityManager()
    
    func isConnectedToInternet() -> Bool {
        return reachabilityManager?.isReachable ?? false
    }
}
