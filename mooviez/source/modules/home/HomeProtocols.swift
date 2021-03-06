//
//  HomeProtocols.swift
//  mooviez
//
//  Created by Betül Çalık on 27.02.2022.
//

import Foundation

// MARK: - View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }

    func handleOutput(_ output: HomePresenterOutput)
}

enum MovieType {
    case upcomingMovies
    case topRatedMovies
    case trendingMovies
}

// MARK: - Interactor
protocol HomeInteractorProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
    var presenter: HomePresenterProtocol? { get set }
    
    func load()
    func getUpcomingMovies()
    func getTopRatedMovies()
    func getTrendingMovies()
    func selectMovie(with movieType: MovieType, at index: Int)
}

protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}

enum HomeInteractorOutput {
    case showUpcomingMovies([Movie])
    case showTopRatedMovies([Movie])
    case showTrendingMovies([Movie])
    case showMovieDetail(Movie)
}

// MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    func load()
    func selectMovie(with movieType: MovieType, at index: Int)
}

enum HomePresenterOutput {
    case showUpcomingMovies([Movie])
    case showTopRatedMovies([Movie])
    case showTrendingMovies([Movie])
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    static func build() -> HomeViewProtocol
    func navigateToDetail(with movie: Movie, on view: HomeViewProtocol)
}
