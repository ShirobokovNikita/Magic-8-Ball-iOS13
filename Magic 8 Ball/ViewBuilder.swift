//
//  ViewBuilder.swift
//  Magic 8 Ball
//
//  Created by Nikita Shirobokov on 12.11.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

protocol ViewBuilderDelegate: AnyObject {
    func didTapAnswer()
}

private extension String {
    static let label = "Ask Me Anything"
    static let button = "Ask"
}

class ViewBuilder {
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
    
    weak var delegate: ViewBuilderDelegate?
    
    static let shared = ViewBuilder()
    
    lazy var verticalStack: UIStackView = {
        let container = UIStackView()
        container.axis = .vertical
        container.addAllArrangedSubviews(titleQuestion, ballImage, answerButton)
        container.spacing = 55
        container.alignment = .center
        container.distribution = .equalSpacing
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var titleQuestion: UILabel = {
        let label = UILabel()
        label.text = .label
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return label
    }()
    
    lazy var ballImage: UIImageView = {
        let image = UIImageView()
        image.image = ballArray.first
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 300).isActive = true
        image.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return image
    }()
    
    lazy var answerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(.button, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 138).isActive = true
        button.heightAnchor.constraint(equalToConstant: 58).isActive = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapAnswer), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapAnswer() {
        delegate?.didTapAnswer()
    }
    
}
