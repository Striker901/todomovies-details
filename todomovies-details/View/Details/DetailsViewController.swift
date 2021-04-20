//
//  DetailsViewController.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 09/04/21.
//

import UIKit
import Nuke
import SwiftSpinner

class DetailsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var bottomContainer: UIView!
    @IBOutlet private weak var moviesTableView: UITableView! {
        didSet {
            moviesTableView.register(UINib(nibName: "MovieDetailTableViewCell", bundle: nil), forCellReuseIdentifier: kMovieDetailsCellIdentifier)
        }
    }
    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var countView: CustomIconView!
    @IBOutlet private weak var populatiryView: CustomIconView!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    var listDetails: [MovieListDetails]!
    var movieDetails: MovieDetails!
    
    // MARK: - General Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftSpinner.hide()
        backButton.layer.cornerRadius = 16
        if let image = movieDetails.poster_path {
            backgroundImage.loadImage(withPath: image)
        }
        titleLabel.text = movieDetails.original_title
        countView.image = UIImage(systemName: "heart.fill")
        countView.title = "\(movieDetails.vote_count) Likes"
        populatiryView.image = UIImage(systemName: "circle.bottomhalf.fill")
        populatiryView.title = "\(String(format: "%.2f", movieDetails.popularity))% de Popularidade"
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kMovieDetailsCellIdentifier, for: indexPath) as! MovieDetailTableViewCell
        cell.bannerImageUrl = "https://image.tmdb.org/t/p/w200/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png"
        cell.title = "test"
        cell.segment = "segment test"
        cell.hasCheck = true
        
        return cell
    }
    
    // MARK: - IBActions
    
    @IBAction private func didTouchBackButton(_ sender: UIButton) {
        if navigationController != nil && navigationController!.viewControllers.first != self {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
    }
    
    @IBAction private func didTouchLikeButton(_ sender: UIButton) {
        likeButton.isSelected = !likeButton.isSelected
    }
}
