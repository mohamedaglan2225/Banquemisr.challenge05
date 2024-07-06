//
//  UpcomingNetwork.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//

import Foundation

struct UpcomingNetwork {
    private init() {}
}

extension UpcomingNetwork {
    
    static func upcomingMoviesApi(page: Int) -> Endpoint<UpcomingMoviesModel> {
        return .init(method: .get, path: "3/movie/upcoming", queries: ["page": page] , headerType: .authorized(token: UserDefaults.accessToken ?? ""))
    }
    
    
}
