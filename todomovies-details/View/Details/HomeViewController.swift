//
//  HomeViewController.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 15/04/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var apiKeyView: CustomTextField! { didSet { apiKeyView.style = .apiKey } }
    @IBOutlet private weak var movieIdView: CustomTextField! { didSet { apiKeyView.style = .movieId } }
    @IBOutlet private weak var languageView: CustomTextField! { didSet { apiKeyView.style = .language } }
    @IBOutlet private weak var continueButton: UIButton!
    
    private var movieViewModel = MovieViewModel()
    private let locale = Locale.current
    private var language: String?

    // MARK: - General Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureView()
        continueButton.layer.cornerRadius = 8
    }
    
    private func configureView() {
        var isButtonActive: Bool = false
        isButtonActive = !(apiKeyView.text!.isEmpty && movieIdView.text!.isEmpty)
        
        continueButton.isEnabled = isButtonActive
    }
    
    
    // MARK: - IBActions
    
    @IBAction private func didTouchContinueButton(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "Ops!", message: "Algo deu errado", preferredStyle: UIAlertController.Style.alert)
        if let apiKey = apiKeyView.text, !apiKey.isEmpty {
            if let movieId = movieIdView.text, !movieId.isEmpty {
                if languageView.text!.isEmpty {
                    language = "\(locale.languageCode!)_\(locale.regionCode!)"
                } else {
                    language = languageView.text
                }
                self.movieViewModel.presentMovieList(withViewController: self, forMovieId: Int(movieId)!, forLanguage: language!, forApiKey: apiKey)
            }
        } else {
            alertVC.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel))
            self.present(alertVC, animated: true)
        }
    }
}
