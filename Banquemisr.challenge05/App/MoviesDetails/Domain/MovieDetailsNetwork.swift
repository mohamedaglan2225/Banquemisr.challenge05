//
//  MovieDetailsNetwork.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/7/24.
//

import Foundation

struct MovieDetailsNetwork {
    private init() {}
}

extension MovieDetailsNetwork {
    
    static func movieDetailsApi(movieId: Int) -> Endpoint<MovieDetailsModel> {
        return .init(method: .get, path: "3/movie/\(movieId)", headerType: .authorized(token: UserDefaults.accessToken ?? ""))
    }
}
