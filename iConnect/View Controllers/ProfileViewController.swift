//
//  ProfileViewController.swift
//  iConnect
//
//  Created by Maxim Zvenigorodsky on 23.10.2020.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBAction func logOutButton(_ sender: UIButton) {
        logout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Profile"
    }
    
    // log out function
    func logout () {
        let startViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.startViewController) as? UIViewController
        
        view.window?.rootViewController = startViewController
        view.window?.makeKeyAndVisible()
    }

}
