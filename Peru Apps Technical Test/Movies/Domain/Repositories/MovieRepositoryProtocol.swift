//
//  MovieRepositoryProtocol.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/4/20.
//

import Foundation
import Combine

protocol MovieRepositoryProtocol {
    func getAllMovies() -> AnyPublisher<Movie, Error>
}
