//
//  MovieApi.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 14/04/21.
//

import Foundation
import Moya

class MovieApi {
    typealias DetailsCompletion = (Result<DetailsResponse, NetworkError>) -> Void
    typealias DetailsListCompletion = (Result<DetailsListResponse, NetworkError>) -> Void
    
    private let provider = MoyaProvider<MovieTarget>.init()
    
    func movieDetails(forMovieId movieId: Int, forLanguage language: String, forApiKey apiKey: String, withCompletion completion: @escaping DetailsCompletion) {
        provider.request(.movie(movieId: movieId, language: language, apiKey: apiKey)) { (result) in
            switch result {
            case .success(let response):
                do {
                    completion(.success(try response.map(MovieDetails.self)))
                } catch {
                    completion(.failure(.parseJSON))
                }
            case .failure(let error):
                completion(.failure(.default(error: error)))
            }
        }
    }
    
    func movieListDetails(forMovieId movieId: Int, forLanguage language: String, forApiKey apiKey: String, withCompletion completion: @escaping DetailsListCompletion) {
        provider.request(.similarList(movieId: movieId, language: language, apiKey: apiKey)) { (result) in
            switch result {
            case .success(let response):
                do {
                    completion(.success(try response.map(DetailsListResponse.self)))
                } catch {
                    completion(.failure(.parseJSON))
                }
            case .failure(let error):
                completion(.failure(.default(error: error)))
            }
        }
    }
}
