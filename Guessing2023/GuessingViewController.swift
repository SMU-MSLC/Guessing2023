//
//  GuessingViewController.swift
//  Guessing2023
//
//  Created by Eric Cooper Larson on 8/28/23.
//

import UIKit

class GuessingViewController: UIViewController {
    
    // MARK: Model for guessing
    var guessModel = GuessModel()
    
    // MARK: UI Outlets
    @IBOutlet weak var guessNumberTextField: UITextField!
    @IBOutlet weak var largeFeedbackLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var makeGuessButton: UIButton!
    
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup the UITextfield to be active, with keyboard on screen!
        
        guessNumberTextField.delegate = self
        guessNumberTextField.becomeFirstResponder()
        
    }
    

    
    // MARK: UI Actions
    /// Make a guess from the user this comes directly from Text field, so we need to
    ///   check if text is entered correctly. Once a guess is made, update the UI with feedback
    @IBAction func makeGuess(){
        
        // setup some defaults for text and animation
        // these variables will be updated based on the guess
        var textToDisplay = ""
        var largeTextToDisplay = ""
        
        var anim = UIView.AnimationOptions.transitionCrossDissolve
        var duration = 0.33
        
        // large "if let" statement to check on consistency
        // 1. Can we get the text,
        // 2. Can the text be made an integer
        // 3/4. Is the integer in range?
        if let userGuess = self.guessNumberTextField.text,
            let userGuessInt = Int(userGuess),
            userGuessInt <= guessModel.upperBound(),
            userGuessInt >= guessModel.lowerBound(){
            
            
            
            switch guessModel.makeGuess(userGuessInt){
                case GuessValueCorrect:
                    // everything is good, update the UI
                    textToDisplay = "Correct!"
                    self.guessNumberTextField.resignFirstResponder() //dismiss keyboard
                
                    // give longer, more visual animation
                    anim = .transitionFlipFromRight
                    duration = 3.0
                
                    // disable button, no new guesses
                    self.makeGuessButton.isEnabled = false
                    
                case GuessValueLower:
                    textToDisplay = "Lower!"
                case GuessValueHigher:
                    textToDisplay = "Higher!"
                default:
                    textToDisplay = "never will get here"
            }
            
            // update the text for guess range
            largeTextToDisplay = "\(guessModel.lowerBound()) < X < \(guessModel.upperBound())"
            
        }else{
            // something was malformed from Text field
            //  of the guess was out of range
            //  give some generic feedback to user
            largeTextToDisplay = "Please enter a number between \(guessModel.lowerBound()) and \(guessModel.upperBound())"
            
            // TODO: special case after they guessed the correct number?
        }
        
        // clear the text field
        self.guessNumberTextField.text = ""
        
        // update the user feedback label
        // use closure for animation ending
        UIView.transition(with: self.feedbackLabel,
              duration: duration,
              options: anim,
              animations: {
                            self.feedbackLabel.text = textToDisplay
                          },
              completion: nil)
        
        // update the user feedback large label
        UIView.transition(with: self.largeFeedbackLabel,
              duration: duration,
              options: anim,
              animations: {
                            self.largeFeedbackLabel.text = largeTextToDisplay
                          },
              completion: nil)
        
    }
    
    @IBAction func tapDidCancel(_ sender: UITapGestureRecognizer) {
        // user tapped off of text field
        self.guessNumberTextField.resignFirstResponder() //dismiss keyboard
    }
    

}

// MARK: Extension for UITextFieldDelegate
// placing Delegate functions here for clarity, very common practice
extension GuessingViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
