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
        addStylesToRegister()
        
    }
    
    
    func databaseOperation(){
        
        ref = Database.database().reference()
        
        //self.ref.child("df").child("articles") .setValue(["username": "testusername2"])
       
    self.ref.child("Users").childByAutoId().setValue(["FirstName":txtFName.text!,"LastName":txtLName.text!,"Email":txtEmail.text!,"Password":txtPassword.text!,"ZipCode":txtZipCode.text!])
        
        //create the user in authentication
        
        Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { authResult, error in
            // [START_EXCLUDE]
            //strongSelf.hideSpinner {
                guard let user = authResult?.user, error == nil else {
                    //strongSelf.showMessagePrompt(error!.localizedDescription)
                    return
                }
                print("\(user.email!) created")
                //strongSelf.navigationController?.popViewController(animated: true)
            
            // [END_EXCLUDE]
        }
        
        
        let alertController = UIAlertController(title: "Success", message: "User Registration Success !", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    func addStylesToRegister()  {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        
        txtFName.roundCorners([.topLeft,], radius: 10)
        txtLName.roundCorners([.topRight,], radius: 10)
        txtEmail.roundCorners([.bottomLeft,.bottomRight], radius: 10)
        txtPassword.roundCorners([.topLeft,.topRight], radius: 10)
        txtConfirmPassword.roundCorners([.bottomLeft,.bottomRight], radius: 10)
        txtZipCode.roundCorners([.bottomLeft,.bottomRight,.topRight,.topLeft], radius:10)
        
        txtFName.setLeftPaddingPoints(8)
        txtLName.setLeftPaddingPoints(8)
        txtEmail.setLeftPaddingPoints(8)
        txtPassword.setLeftPaddingPoints(8)
        txtConfirmPassword.setLeftPaddingPoints(8)
        txtZipCode.setLeftPaddingPoints(8)
        
        
        
        txtFName.placeholderColor(color: UIColor.white)
        txtLName.placeholderColor(color: UIColor.white)
        txtEmail.placeholderColor(color: UIColor.white)
        txtPassword.placeholderColor(color: UIColor.white)
        txtConfirmPassword.placeholderColor(color: UIColor.white)
        txtZipCode.placeholderColor(color: UIColor.white)
    }
}