//
//  MovieDetailsViewModel.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 14/04/21.
//

import Foundation
import UIKit
import SwiftSpinner

class MovieViewModel: DataLoad {
    typealias Completion = () -> Void
    
    private(set) var movieDetails: MovieDetails!
    private(set) var movieList: [MovieListDetails]!
    
    func loadData(with completion: @escaping LoadCompletion) {
        
    }
    
    func presentMovieList(withViewController viewController: UIViewController, forMovieId movieId: Int, forLanguage language: String , forApiKey apiKey: String) {
        MovieApi().movieDetails(forMovieId: movieId, forLanguage: language, forApiKey: apiKey) { (result) in
            SwiftSpinner.show("")
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let detailsVC = viewController.modalViewController(withStoryboarName: "Details", "DetailsViewController") as! DetailsViewController
                    detailsVC.movieDetails = response
                    
                    viewController.present(detailsVC, animated: true)
                }
            case .failure(let _):
                SwiftSpinner.hide {
                    let alertVC = UIAlertController(title: "Ops!", message: "Algo deu errado", preferredStyle: .alert)
                    
                    viewController.present(alertVC, animated: true) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                            viewController.dismiss(animated: true)
                        })
                    }
                }
            }
        }
    }
}
