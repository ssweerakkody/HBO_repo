//
//  Extrensions.swift
//  InputForm
//
//  Created by Suneth on 1/7/20.
//  Copyright © 2020 Suneth. All rights reserved.
//

import UIKit

extension UITextField {
    func toStyledTextField() { // Give Round Border and Left Placholder Padding
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        self.leftViewMode = UITextField.ViewMode.always
    }
}

extension UIButton{
    func toRoundButtonEdges(){
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}

