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
        default: return URL(string: "https://api.themoviedb.org/3")!
        }
    }
    
    var path: String {
        switch self {
        case .similarList(let movieId, _, _): return "/movie\(movieId)/similar"
        case .movie(let movieId, _, _): return "/movie/\(movieId)"
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
        var parameters: [String: String] = [:]
        switch self {
        case .movie(_, let language, let apiKey), .similarList(_, let language, let apiKey):
            parameters["api_key"] = apiKey
            parameters["language"] = language
        
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        default: return URLEncoding.default
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
