//
//  AddMovieViewController.swift
//  HBO
//
//  Created by Suneth on 1/18/20.
//  Copyright © 2020 Suneth. All rights reserved.
//

import UIKit
import Firebase


class AddMovieViewController: UIViewController {
    
    
     var imagePicker: ImagePicker!
    
    @IBOutlet weak var MovieImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        addStylesToRegister()
        
    }
    
    func addStylesToRegister()  {
        
    }
    
    @IBAction func UploadImage(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
}
