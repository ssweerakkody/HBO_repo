//
//  LoginViewController.swift
//  InputForm
//
//  Created by Suneth on 1/7/20.
//  Copyright © 2020 Suneth. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController ,UITextFieldDelegate {
    
    //Textfields
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    //Buttons
    @IBOutlet weak var btnSignIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtEmail.delegate = self
        txtEmail.toStyledTextField()
        txtPassword.toStyledTextField()
    
        btnSignIn.toRoundButtonEdges()
        
    }
    
    

    
}
