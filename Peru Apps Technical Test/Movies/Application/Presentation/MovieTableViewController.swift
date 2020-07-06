//
//  HomeTableViewController.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/4/20.
//

import UIKit
import Combine

class MovieTableViewController: UITableViewController {
    private let cellMovieRowIdentifier = "movie_row"
    
    var cancellables = Set<AnyCancellable>()
    var loginRepository: LoginRepository!
    
    var movies: Movie? {
        didSet {
            if let movies = movies {
                self.updateProfiles(movies: movies)
            }
        }
    }
    var movieSelected: Detail?
    
    private lazy var dataSource = makeDataSource()
    
    enum Sections: CaseIterable {
        case content
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        MovieUseCase(repository: MoviesRepository())
            .getMovies()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] movies in
                self?.movies = movies
            }).store(in: &cancellables)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movie_detail" {
            if let movieDetailTableViewController = segue.destination as? MovieDetailViewController {
                if let detail = self.movieSelected {
                    movieDetailTableViewController.detail = detail
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = movies?.data[indexPath.row].detail
        self.movieSelected = detail
        performSegue(withIdentifier: "movie_detail", sender: nil)
    }
}

extension MovieTableViewController {
    func makeDataSource() -> UITableViewDiffableDataSource<Sections, MovieData> {
        let dataSource = UITableViewDiffableDataSource<Sections, MovieData>(tableView: tableView, cellProvider: { (tableView, indexPath, movieRow) -> UITableViewCell? in
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: self.cellMovieRowIdentifier, for: indexPath) as! MovieTableViewCell
                cell.setupCell(image: movieRow.detail.img, title: movieRow.detail.title, description: movieRow.detail.description)
                return cell
            } else {
                return nil
            }
        })
        return dataSource
    }
    
    func updateProfiles(movies: Movie) {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, MovieData>()
        snapshot.appendSections([.content])
        snapshot.appendItems(movies.data, toSection: .content)
        
        dataSource.apply(snapshot)
    }
}
