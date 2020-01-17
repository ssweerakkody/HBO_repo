//
//  ViewController.swift
//  InputForm
//
//  Created by Suneth on 1/6/20.
//  Copyright © 2020 Suneth. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var txtName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtName.delegate = self
        txtName.toStyledTextField()
        
    }


    @IBAction func ViewInputs(_ sender: Any) {
        
        let name = txtName.text!
        
        let alertController = UIAlertController(title: "Hello ! ", message: "You have input "+name, preferredStyle:UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style:UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func EditingText(_ sender: UITextField) {
    }
    
}

