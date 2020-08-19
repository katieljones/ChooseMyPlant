//
//  Randomiser.swift
//  Choose My Plant
//
//  Created by Matthew Lock on 8/19/20.
//  Copyright © 2020 Katie Jones. All rights reserved.
//

import Foundation

class Plants {
    func plantChooser() -> String {
        let plant = ["Winter Cherry", "Elephant Ears", "African Violet", "Beach Spider Lily", "Bird of Paradise", "Flaming Sword", "Lollipop Plant"]
        return (plant.randomElement()!)
    }
}
