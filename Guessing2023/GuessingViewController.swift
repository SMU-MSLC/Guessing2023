//
//  GuessingViewController.swift
//  Guessing2023
//
//  Created by Eric Cooper Larson on 8/28/23.
//

import UIKit

class GuessingViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var feedbackLabel: UILabel!
    
    var guessModel = GuessModel()
    
    @IBOutlet weak var guessNumberTextField: UITextField!
    
    @IBOutlet weak var largeFeedbackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guessNumberTextField.delegate = self
        guessNumberTextField.becomeFirstResponder()
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        return true
    }
    
    @IBAction func makeGuess(){
        var textToDisplay = ""
        var largeTextToDisplay = ""
        
        var anim = UIView.AnimationOptions.transitionCrossDissolve
        var duration = 0.33
        
        if let userGuess = self.guessNumberTextField.text,
            let userGuessInt = Int(userGuess),
            userGuessInt <= guessModel.upperBound(),
            userGuessInt >= guessModel.lowerBound(){
            
            
            
            switch guessModel.makeGuess(userGuessInt){
            case GuessValueCorrect:
                textToDisplay = "Correct!"
                self.guessNumberTextField.resignFirstResponder()
                anim = .transitionFlipFromRight
                duration = 3.0
            case GuessValueLower:
                textToDisplay = "Lower!"
            case GuessValueHigher:
                textToDisplay = "Higher!"
            default:
                textToDisplay = "never will get here"
            }
            
            largeTextToDisplay = "\(guessModel.lowerBound()) < X < \(guessModel.upperBound())"
            
        }else{
            largeTextToDisplay = "please enter a number between \(guessModel.lowerBound()) and \(guessModel.upperBound())"
        }
        
        self.guessNumberTextField.text = ""
        
        // update the user feedback
        UIView.transition(with: self.feedbackLabel,
              duration: duration,
              options: anim,
              animations: {
            self.feedbackLabel.text = textToDisplay
                          },
              completion: nil)
        
        // update the user feedback
        UIView.transition(with: self.largeFeedbackLabel,
              duration: duration,
              options: anim,
              animations: {
            self.largeFeedbackLabel.text = largeTextToDisplay
                          },
              completion: nil)
        
    }
    
    @IBAction func tapDidCancel(_ sender: UITapGestureRecognizer) {
        self.guessNumberTextField.resignFirstResponder()
    }
    

}
