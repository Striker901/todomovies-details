//
//  NetworkConfig.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 14/04/21.
//

import Foundation
import Moya

enum NetworkError: Error {
    case custom(message: String), `default`(error: MoyaError), parseJSON, unowned
    
    var customMessage: String? {
        switch self {
        case .custom(let message): return message
        default: return nil
        }
    }
}

class NetworkConfig {
    
    private static var sharedNetworkConfig: NetworkConfig = {
        return NetworkConfig.init()
    }()
    
    var baseUrl: URL
    private let baseAPIKey = "8afe17b8f32ffdfb65413b90e0e7c515"
    
    // MARK: - Instance
    
    private init() {
        baseUrl = URL(string: "https://api.themoviedb.org/3")!
    }
    
    class func shared() -> NetworkConfig {
        return sharedNetworkConfig
    }
    
}


