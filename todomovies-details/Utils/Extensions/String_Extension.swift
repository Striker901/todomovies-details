//
//  UIView_Extension.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 19/04/21.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    func loadImage(withPath path: String) {
        let baseUrl = "https://image.tmdb.org/t/p/w500/"
        
        if let url = URL(string: baseUrl.appending(path)) {
            Nuke.loadImage(with: url, into: self)
        }
    }
}
