//
//  DataLoad.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 14/04/21.
//

import Foundation

protocol DataLoad {
    typealias LoadCompletion = () -> Void
    
    func loadData(with completion: @escaping LoadCompletion)
}
