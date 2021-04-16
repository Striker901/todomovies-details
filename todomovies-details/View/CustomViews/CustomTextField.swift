//
//  CustomTextField.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 15/04/21.
//

import UIKit
import Foundation

class CustomTextField: UIView {
    
    // MARK: Properties
    
    enum Style {
        case apiKey
        case movieId
        case language
        
        var placeholder: String {
            switch self {
            case .apiKey: return "fodase1"
            case .language: return "fodase2"
            case .movieId: return "fodase3s"
            }
        }
        var imageIcon: UIImage {
            switch self {
            case .apiKey: return #imageLiteral(resourceName: "checkbox")
            case .language: return #imageLiteral(resourceName: "checkbox")
            case .movieId: return #imageLiteral(resourceName: "checkbox")
            }
        }
    }
    
    @IBOutlet private weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.image = style?.imageIcon
        }
    }
    @IBOutlet private weak var textField: UITextField! {
        didSet {
            textField.attributedPlaceholder = NSAttributedString(string: style?.placeholder ?? "INFERNO", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        }
    }
    
    var style: Style?
    var text: String? { get {return textField.text } }
    
    // MARK: - Instance
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        communInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        communInit()
    }
    
    private func communInit() {
        let view = UINib(nibName: "CustomTextField", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        view.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        addSubview(view)
        
        var constraints: [NSLayoutConstraint] = []
        
        constraints.append(view.trailingAnchor.constraint(equalTo: trailingAnchor))
        constraints.append(view.leadingAnchor.constraint(equalTo: leadingAnchor))
        constraints.append(view.bottomAnchor.constraint(equalTo: bottomAnchor))
        constraints.append(view.topAnchor.constraint(equalTo: topAnchor))
        
        addConstraints(constraints)
        NSLayoutConstraint.activate(constraints)
    }
}
