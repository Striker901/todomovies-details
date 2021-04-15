//
//  UIViewController_Extension.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 14/04/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func viewController(withStoryboarName storyboarName: String, _ viewControllerName: String)  -> UIViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboarName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerName)
    }
}
