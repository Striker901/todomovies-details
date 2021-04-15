//
//  DetailsViewController.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 09/04/21.
//

import UIKit
import Nuke

class DetailsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var bottomContainer: UIView!
    @IBOutlet private weak var moviesTableView: UITableView! {
        didSet {
            moviesTableView.register(UINib(nibName: "MovieDetailTableViewCell", bundle: nil), forCellReuseIdentifier: kMovieDetailsCellIdentifier)
        }
    }
    @IBOutlet private var heightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backgroundImage: UIImageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var listDetails: MovieListDetails!
    var movieDetails: MovieDetails!
    
    // MARK: - GeneralMethods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 16
        
        if let url = URL(string: "https://cdn.motivationgrid.com/wp-content/uploads/2018/03/Johnny-Depp-Wallpaper.jpeg") {
            Nuke.loadImage(with: url, into: backgroundImage)
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailTableViewCell
        cell.bannerImageUrl = "https://image.tmdb.org/t/p/w500/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png"
        cell.title = "test"
        cell.segment = "segment test"
        cell.hasCheck = true
        
        return cell
    }

}

