//
//  NowPlayingNetwork.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//

import Foundation

struct NowPlayingNetwork {
    private init() {}
}

extension NowPlayingNetwork {
    
    static func nowPlayingMoviesApi(page: Int) -> Endpoint<NowPlayingModel> {
        return .init(method: .get, path: "3/movie/now_playing", queries: ["page": page] , headerType: .authorized(token: UserDefaults.accessToken ?? ""))
    }
}
