//
//  RatingControl.swift
//  firstApp
//
//  Created by j0cker on 19/08/17.
//  Copyright © 2017 j0cker. All rights reserved.
//

import UIKit


class RatingControl: UIStackView {
    
    private var ratingButtons = [UIButton]()
    
    //set and get methods are built automatically
    internal var rating: Int = 0 {
        didSet {
            NSLog("RatingControl didset")
            updateButtonSelectionStates()
        }
    }
    
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        NSLog("RatingControl init")
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons() {
        
        NSLog("setupButtons rating " + rating.description)
        
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        var varIni: Int = 0
        
        // Load Button Images
        let bundle = NSBundle(forClass: self.dynamicType)
        //let bundle = Bundle(for: type(of: self)) swift 3
        
        //let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection) swift 3
        
        let filledStar = UIImage(named: "blackStar", inBundle: bundle, compatibleWithTraitCollection: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", inBundle: bundle, compatibleWithTraitCollection: self.traitCollection)
        let highlightedStar = UIImage(named:"blueStar", inBundle: bundle, compatibleWithTraitCollection: self.traitCollection)
        
        for _ in 0..<starCount {
            
        // Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.redColor()
            
        // Set the accessibility label
        button.accessibilityLabel = "Set \(varIni + 1) star rating"
            
        //button.setImage(filledStar, for: .selected) swift 3
        
        // Set the button images
        button.setImage(emptyStar, forState: UIControlState.Normal)
        button.setImage(filledStar, forState: UIControlState.Selected)
        button.setImage(highlightedStar, forState: UIControlState.Highlighted)
        button.setImage(highlightedStar, forState: [UIControlState.Highlighted, UIControlState.Selected])
            
        //button.setTitle("Star" + varIni.description, forState: UIControlState.Normal)
        
        // Add constraints swift 3
        //button.translatesAutoresizingMaskIntoConstraints = false
        //button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        //button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)

        
        NSLayoutConstraint.activateConstraints([
            button.widthAnchor.constraintEqualToConstant(40),
            button.heightAnchor.constraintEqualToConstant(40)
            ])
        // Add the button to the stack
        addArrangedSubview(button)  // Add the new button to the rating button array
            
        ratingButtons.append(button)
            
            varIni += 1
            
        }
        
        updateButtonSelectionStates()
        NSLog("setupButtons fin")
    }
    
    private func updateButtonSelectionStates() {
        //ratingButtons.enumerate() swift 3
        for (index, button) in ratingButtons.enumerate() {
            
            
            NSLog("updateButtonSelectionStates index " + index.description + " rating " + rating.description)
            
            // If the index of a button is less than the rating, that button should be selected.
            
            //button.isSelected = index < rating      swift 3
            //dispatch_async i use it in order to make the button clicked a highleted, if dont use it the button clicked doesnt get highlighted and the others buttons does.
            dispatch_async(dispatch_get_main_queue(), {
                if index + 1<=self.rating{
                    button.highlighted = true
                } else {
                    button.highlighted = false
                }
            })
            
            // Set the hint string for the currently selected star
            
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
            
            
        }
        
        NSLog("updateButtonSelectionStates fin rating " + rating.description)
    }
    
    func ratingButtonTapped(button:UIButton) {
        
        //tan solo da el valor del rating en la varibale global de la clase
        
        let bul: Int = 5
        
        NSLog("ratingButtonTapped " + bul.description)
        
        
        //NSLog("ratingButtonTapped title " + button.currentTitle!)
        
        //index(of: button) swift 3
        
        guard let index = ratingButtons.indexOf(button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
        
        
        NSLog("ratingButtonTapped rating " + rating.description)
        updateButtonSelectionStates()
        
    }
}
