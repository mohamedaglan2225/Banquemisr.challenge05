//
//  UpcomingMoviesViewModel.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//

import Combine

final class UpcomingMoviesViewModel: BaseViewModel {
 
    //MARK: - Properties -
    private(set) var isLoading: PassthroughSubject<Bool, Never> = .init()
    private(set) var errorPublisher: PassthroughSubject<Error, Never> = .init()
    private(set) var upcomingMoviesModel: CurrentValueSubject<[UpcomingMoviesResult] , Never> = .init([])
    private var isLastPage: Bool = false
    private var currentPage: Int = 1
    private var isFetching: Bool = false
    var currentPageNumber: Int {
        return currentPage
    }
    
    
    
    
    //MARK: - Networking -
    func upcomingMoviesApi(page: Int) {
        guard !isFetching && !isLastPage else { return }
        isFetching = true
        isLoading.send(true)
        Task {
            do {
                let request = UpcomingNetwork.upcomingMoviesApi(page: page)
                let data = try await self.requestGeneralResponse(request)
                
                if let moviesData = data.results {
                    self.upcomingMoviesModel.value.append(contentsOf: moviesData)
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
        upcomingMoviesApi(page: currentPage + 1)
    }
    
}
