//
//  MovieTarget.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 14/04/21.
//

import Foundation
import Moya

enum MovieTarget {
    case movie(movieId: Int, language: String, apiKey: String)
    case similarList(movieId: Int, language: String, apiKey: String)
}

extension MovieTarget: TargetType {
    var baseURL: URL {
        switch self {
        case .movie(let movieId, let language, let apiKey): return URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(apiKey)&language=\(language)")!
        case .similarList(let movieId, let language, let apiKey): return URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/similar?api_key=\(apiKey)&language=\(language)")!
        }
    }
    
    var path: String {
        switch self {
        default: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .movie, .similarList: return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        default: return Data()
        }
    }
    
    var task: Task {
        switch self {
        default: return .requestPlain
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        default: return URLEncoding.queryString
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var validationType: ValidationType {
        switch self {
        default: return .successCodes
        }
    }
}
