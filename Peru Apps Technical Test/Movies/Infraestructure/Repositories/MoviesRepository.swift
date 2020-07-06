//
//  MovieRepository.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/4/20.
//

import Foundation
import Combine

struct MoviesRepository: MovieRepositoryProtocol {
    let loginRepository: LoginRepository = LoginRepository()
    
    func getAllMovies() -> AnyPublisher<Movie, Error> {
        let url = URL(string: "http://api-movies.pappstest.com/api/v1/movies")!
        let sessionWithLoginToken: URLSession = {
            let configuration = URLSessionConfiguration.default
            let authValue: String = "Bearer \(loginRepository.getToken())"
            print(loginRepository.getToken())
            configuration.httpAdditionalHeaders = ["Authorization": authValue]
            return URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
        }()
        
        return sessionWithLoginToken.dataTaskPublisher(for: url)
            .mapError { $0 as Error }
            .map { $0.data }
            .decode(type: Movie.self, decoder: JSONDecoder.init())
            .breakpoint()
            .eraseToAnyPublisher()
    }
}
