//
//  PopularNetwork.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//

import Foundation

struct PopularNetwork {
    private init() {}
}

extension PopularNetwork {
    
    static func popularMoviesApi(page: Int) -> Endpoint<PopularMoviesModel> {
        return .init(method: .get, path: "3/movie/popular", queries: ["page": page] , headerType: .authorized(token: UserDefaults.accessToken ?? ""))
    }
    
}
