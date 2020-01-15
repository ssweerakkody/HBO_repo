//
//  RegistrationViewController.swift
//  InputForm
//
//  Created by Suneth on 1/12/20.
//  Copyright © 2020 Suneth. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController{
    
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtZipCode: UITextField!
    
    
    @IBAction func btnRegister(_ sender: Any) {
    
        databaseOperation()
        
    }
    
      var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    
    func databaseOperation(){
        
        ref = Database.database().reference()
        
        //self.ref.child("df").child("articles") .setValue(["username": "testusername2"])
    self.ref.child("Users").childByAutoId().setValue(["FirstName":txtFName.text!,"LastName":txtLName.text!,"Email":txtEmail.text!,"Password":txtPassword.text!,"ZipCode":txtZipCode.text!])
        
        let alertController = UIAlertController(title: "Success", message: "User Registration Success !", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}
