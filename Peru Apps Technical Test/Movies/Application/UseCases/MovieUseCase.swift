//
//  MoviesUseCase.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/4/20.
//

import Foundation
import Combine

struct MovieUseCase {
    let repository: MovieRepositoryProtocol
    
    func getMovies() -> AnyPublisher<Movie, Error> {
        repository.getAllMovies()
    }
}
