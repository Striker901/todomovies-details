//
//  CustomIconView.swift
//  todomovies-details
//
//  Created by Vinícius D. Brandâo on 15/04/21.
//

import UIKit
import Foundation

class CustomIconView: UIView {
    
    // MARK: Properties
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel! 
    
    var image: UIImage? { didSet { iconImageView.image = image } }
    var title: String? { didSet { titleLabel.text = title } }
    
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
        let view = UINib(nibName: "CustomIconView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
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
