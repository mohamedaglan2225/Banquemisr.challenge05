//
//  NowPlayingMoviesViewModel.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//


import Combine

final class NowPlayingMoviesViewModel: BaseViewModel {
    
    //MARK: - Properties -
    private(set) var isLoading: PassthroughSubject<Bool, Never> = .init()
    private(set) var errorPublisher: PassthroughSubject<Error, Never> = .init()
    private(set) var nowPlayingMoviesModel: CurrentValueSubject<[NowPlayingModelResult] , Never> = .init([])
    private var isLastPage: Bool = false
    private var currentPage: Int = 1
    private var isFetching: Bool = false
    var currentPageNumber: Int {
        return currentPage
    }
    
    //MARK: - Networking -
    func nowPlayingMoviesApi(page: Int) {
        guard !isFetching && !isLastPage else { return }
        isFetching = true
        isLoading.send(true)
        Task {
            do {
                let request = NowPlayingNetwork.nowPlayingMoviesApi(page: page)
                let data = try await self.requestGeneralResponse(request)
                
                if let moviesData = data.results {
                    self.nowPlayingMoviesModel.value.append(contentsOf: moviesData)
                }
                
                self.isLastPage = data.page >= data.totalPages
                self.currentPage = data.page
                
            } catch {
                errorPublisher.send(error)
            }
            
            isFetching = false
            isLoading.send(false)
        }
    }
    
    
    // MARK: - Helper Functions -
    func loadNextPage() {
        nowPlayingMoviesApi(page: currentPage + 1)
    }
    
}
