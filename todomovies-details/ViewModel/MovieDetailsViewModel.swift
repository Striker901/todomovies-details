//
//  MovieDetailsViewModel.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 14/04/21.
//

import Foundation
import UIKit

class MovieViewModel: DataLoad {
    typealias Completion = () -> Void
    
    private(set) var movieDetails: MovieDetails!
    private(set) var movieList: MovieListDetails!
    
    func loadData(with completion: @escaping LoadCompletion) {
        
    }
    
    func presentMovieList(withViewController viewController: UIViewController, forMovieId movieId: Int, forLanguage language: String , forApiKey apiKey: String) {
        MovieApi().movieDetails(forMovieId: movieId, forLanguage: language, forApiKey: apiKey) { (result) in
            switch result {
            case .success(let response):
                self.movieDetails = response
                MovieApi().movieListDetails(forMovieId: movieId, forLanguage: language, forApiKey: apiKey) { (result) in
                    switch result {
                    case .success(let response):
                        let detailsVC = viewController.viewController(withStoryboarName: "Details", "DetailsViewController") as! DetailsViewController
                        detailsVC.movieDetails = self.movieDetails
                        detailsVC.listDetails = response
                        
                        viewController.present(detailsVC, animated: true)
                    case .failure(_): break
                    }
                }
            case .failure(_): break
            }
        }
    }
}
