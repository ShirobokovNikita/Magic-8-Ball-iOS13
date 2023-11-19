//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

extension UIStackView {
    func addAllArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}

class ViewController: UIViewController {

    private let build = ViewBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.382902354, green: 0.8057182431, blue: 0.995292604, alpha: 1)
        build.delegate = self
        setVerticakStackView()
    }
    private func setVerticakStackView() {
        let stack = build.verticalStack
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
}

extension ViewController: ViewBuilderDelegate {
    func didTapAnswer() {
        build.ballImage.image = build.ballArray.randomElement()
    }
}

