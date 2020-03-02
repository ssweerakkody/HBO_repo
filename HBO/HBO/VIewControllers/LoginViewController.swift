//
//  LoginViewController.swift
//  InputForm
//
//  Created by Suneth on 1/7/20.
//  Copyright © 2020 Suneth. All rights reserved.
//
import UIKit
import Firebase

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
        
        // Newly added
        
    }
    
    
    @IBAction func btnSignIn(_ sender: Any){
        
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
            if error == nil{
                //self.performSegue(withIdentifier: "loginToHome", sender: self)
                
                let alertController = UIAlertController(title: "Success", message: "Login Success !", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    
}
