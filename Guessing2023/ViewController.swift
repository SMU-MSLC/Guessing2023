//
//  ViewController.swift
//  Guessing2023
//
//  Created by Eric Cooper Larson on 8/21/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changePressed(_ sender: UIButton) {
        self.topLabel.text = "Hello World, 2023!!"
        
    }
}

