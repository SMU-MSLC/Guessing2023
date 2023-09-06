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
        
        if let userGuess = self.guessNumberTextField.text,
            let userGuessInt = Int(userGuess),
            userGuessInt <= guessModel.upperBound(),
            userGuessInt >= guessModel.lowerBound(){
            
            
            
            switch guessModel.makeGuess(userGuessInt){
            case GuessValueCorrect:
                textToDisplay = "Correct!"
                self.guessNumberTextField.resignFirstResponder()
            case GuessValueLower:
                textToDisplay = "Lower!"
            case GuessValueHigher:
                textToDisplay = "Higher!"
            default:
                textToDisplay = "never will get here"
            }
            
        }else{
            textToDisplay = "please enter a number between \(guessModel.lowerBound()) and \(guessModel.upperBound())"
        }
        
        self.guessNumberTextField.text = ""
        self.feedbackLabel.text = textToDisplay
    }
    
    @IBAction func tapDidCancel(_ sender: UITapGestureRecognizer) {
        self.guessNumberTextField.resignFirstResponder()
    }
    

}
