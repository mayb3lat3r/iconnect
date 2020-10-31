//
//  ViewController.swift
//  iConnect
//
//  Created by Maxim Zvenigorodsky on 22.10.2020.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // это ссылка на какую-либо позицию в базе данных
        Database.database().reference().setValue(10)
        
        title = "EXAMPLE"
    }


}

