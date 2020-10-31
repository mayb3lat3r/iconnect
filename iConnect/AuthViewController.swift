//
//  AuthViewController.swift
//  iConnect
//
//  Created by Maxim Zvenigorodsky on 30.10.2020.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {
    
    var signup: Bool = true{
        willSet{
            if newValue{
                titleLabel.text = "Registration"
                nameField.isHidden = false
                enterButton.setTitle("Sign up", for: .normal)
            }else{
                titleLabel.text = "Log in"
                nameField.isHidden = true
                enterButton.setTitle("Log in", for: .normal)
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func switchLogin(_ sender: UIButton) {
        signup = !signup
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Fill in all the fields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension AuthViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let name = nameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        if(signup){
            if(!name.isEmpty && !email.isEmpty && !password.isEmpty){
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if error == nil {
                        if let result = result{
                            print(result.user.uid)
                        }
                    }
                }
            }else{
                showAlert()
            }
        }else{
            if(!email.isEmpty && !password.isEmpty){
                
            }else{
                showAlert()
            }
        }
        
        return true
    }
}
