//
//  BallModel.swift
//  Magic 8 Ball
//
//  Created by Nikita Shirobokov on 19.11.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

struct BallModel {
    private let images = ["ball1", "ball2", "ball3", "ball4", "ball5"]

    func getRandomImage() -> UIImage? {
        let imageName = images.randomElement() ?? "ball1"
        return UIImage(named: imageName)
    }
}
