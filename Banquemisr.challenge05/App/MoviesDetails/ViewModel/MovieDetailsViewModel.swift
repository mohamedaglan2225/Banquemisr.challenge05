//
//  MovieDetailsViewModel.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//

import Combine

final class MovieDetailsViewModel: BaseViewModel {
    
    //MARK: - Properties -
    private(set) var isLoading: PassthroughSubject<Bool, Never> = .init()
    private(set) var errorPublisher: PassthroughSubject<Error, Never> = .init()
    private(set) var movieDetailsModel: CurrentValueSubject<MovieDetailsModel, Never> = .init(MovieDetailsModel())
    
    
    
    //MARK: - Networking -
    func getMovieDetailsApi(movieId: Int) {
        Task {
            isLoading.send(true)
            do {
                let request = MovieDetailsNetwork.movieDetailsApi(movieId: movieId)
                let data = try await self.requestGeneralResponse(request)
                self.movieDetailsModel.send(data)
            }catch {
                errorPublisher.send(error)
            }
            isLoading.send(false)
        }
    }
    
    
    
}
