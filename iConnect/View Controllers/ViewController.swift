//
//  ViewController.swift
//  iConnect
//
//  Created by Maxim Zvenigorodsky on 22.10.2020.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }

    func setUpElements() {
        Utilities.styleFieldButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }

}

