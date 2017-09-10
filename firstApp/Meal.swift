//
//  Meal.swift
//  firstApp
//
//  Created by j0cker on 09/09/17.
//  Copyright © 2017 j0cker. All rights reserved.
//

import UIKit
import Foundation

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
}
