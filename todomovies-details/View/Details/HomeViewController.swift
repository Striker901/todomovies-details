//
//  HomeViewController.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 15/04/21.
//

import UIKit
import SwiftSpinner

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var continueButton: UIButton! 
    @IBOutlet private weak var apiKeyTextField: UITextField!
    @IBOutlet private weak var apiKeyImageView: UIImageView!
    @IBOutlet private weak var movieIdTextField: UITextField!
    @IBOutlet private weak var movieIdImageView: UIImageView!
    @IBOutlet private weak var languageTextField: UITextField!
    @IBOutlet private weak var languageImageView: UIImageView!
    
    private var movieViewModel = MovieViewModel()
    private let locale = Locale.current
    private var language: String?
    private var apiKeyIsFilled = false
    private var movieIdIsFilled = false

    // MARK: - General Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftSpinner.hide()
        continueButton.layer.cornerRadius = 8
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let shouldChangeCharacters: Bool = true
        
        if textField == apiKeyTextField && textField.text != nil {
            self.apiKeyIsFilled = true
        } else if textField == movieIdTextField && textField.text != nil {
            self.movieIdIsFilled = true
        }
        
        return shouldChangeCharacters
    }
    
    
    // MARK: - IBActions
    
    @IBAction private func didTouchContinueButton(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "Ops!", message: "Algo deu errado", preferredStyle: UIAlertController.Style.alert)
        if let apiKey = apiKeyTextField.text, !apiKey.isEmpty {
            if let movieId = movieIdTextField.text, !movieId.isEmpty {
                if languageTextField.text!.isEmpty {
                    language = "\(locale.languageCode!)_\(locale.regionCode!)"
                } else {
                    language = languageTextField.text
                }
                self.movieViewModel.presentMovieList(withViewController: self, forMovieId: Int(movieId)!, forLanguage: language!, forApiKey: apiKey)
            }
        } else {
            alertVC.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel))
            self.present(alertVC, animated: true)
        }
    }
}
