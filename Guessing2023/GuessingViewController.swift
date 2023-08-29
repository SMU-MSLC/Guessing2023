//
//  GuessingViewController.swift
//  Guessing2023
//
//  Created by Eric Cooper Larson on 8/28/23.
//

import UIKit

class GuessingViewController: UIViewController, UITextFieldDelegate {

    var guessModel = GuessModel()
    
    @IBOutlet weak var guessNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(guessModel.correctNum)
        
        guessNumberTextField.delegate = self
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.guessNumberTextField.resignFirstResponder()
        return true
    }
    

}
