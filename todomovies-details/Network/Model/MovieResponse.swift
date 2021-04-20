//
//  MovieResponse.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 14/04/21.
//

import Foundation
import Moya

typealias DetailsResponse = MovieDetails
typealias DetailsListResponse = [MovieListDetails]

struct MovieDetails: Codable {
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
    let poster_path: String?
    let original_title: String
}

struct MovieListDetails: Codable {
    let results: [MovieDetails]
}
