//
//  MovieDetailTableViewCell.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 11/04/21.
//

import UIKit
import Nuke

let kMovieDetailsCellIdentifier: String = "MovieDetailCell"

class MovieDetailTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var segmentLabel: UILabel!
    @IBOutlet private weak var bannerImageView: UIImageView!
    @IBOutlet private weak var checkImageView: UIImageView!
    
    var title: String? { didSet { titleLabel.text = title } }
    var segment: String? { didSet { segmentLabel.text = segment } }
    var bannerImageUrl: String? { didSet { loadImage(withUrl: bannerImageUrl) } }
    
    var hasCheck: Bool = false {
        didSet {
            checkImageView.isHidden = !hasCheck
        }
    }
    
    // MARK: - GeneralMethods
    
    private func loadImage(withUrl url: String?) {
        if let url = URL(string: url!) {
            Nuke.loadImage(with: url, into: bannerImageView)
        }
    }
}
