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
    
    @IBOutlet weak var txtMovieTitle: UITextField!
    @IBOutlet weak var txtMovieYear: UITextField!
    @IBOutlet weak var txtMovieRating: UITextField!
    
    var imagePicker: ImagePicker!
    
    @IBOutlet weak var MovieImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        addStylesToRegister()
        
    }
    
    @IBAction func SaveMovieData(_ sender: Any) {
        UploadMovieData()
    }
    
    
    func addStylesToRegister()  {
        
    }
    
    @IBAction func UploadImage(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    func UploadMovieData(){
        let alert = UIAlertController(title: nil, message: "Uploding", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        
//        let loggedUserUID = UserDefaults.standard.string(forKey: "UserUID")
//
//        let avatarRef = Database.database().reference().child("profiles").child(loggedUserUID!)
//        avatarRef.observe(.value, with: { snapshot in
//
//            let dict = snapshot.value as? [String: AnyObject]
//            let json = JSON(dict as Any)
//
//            self.avatarImageUrl = json["profileImageUrl"].stringValue
//            self.username = json["First_Name"].stringValue
//
//
//
//        })
        
        guard let Title = txtMovieTitle.text, !Title.isEmpty else {
            alert.dismiss(animated: false, completion: nil)
            showAlert(title: "Check input",message: "Title cannot be empty")
            return
        }
        
        guard let MovieYear = txtMovieYear.text, !MovieYear.isEmpty else {
            alert.dismiss(animated: false, completion: nil)
            showAlert(title: "Check input",message: "Year cannot be empty")
            return
        }
        
        guard let Rating = txtMovieRating.text, !Rating.isEmpty else {
            alert.dismiss(animated: false, completion: nil)
            showAlert(title: "Check input",message: "Rating cannot be empty")
            return
        }
        
        guard let image = MovieImage.image,
            let imgData = image.jpegData(compressionQuality: 1.0) else {
                alert.dismiss(animated: false, completion: nil)
                showAlert(title: "Check input",message: "An Image must be selected")
                return
        }
        
        let imageName = UUID().uuidString
        
        let reference = Storage.storage().reference().child("MovieImages").child(imageName)
        
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        
        reference.putData(imgData, metadata: metaData) { (meta, err) in
            if let err = err {
                alert.dismiss(animated: false, completion: nil)
                self.showAlert(title: "Eror",message: "Error uploading image: \(err.localizedDescription)")
                return
            }
            
            reference.downloadURL { (url, err) in
                if let err = err {
                    alert.dismiss(animated: false, completion: nil)
                    self.showAlert(title: "Eror",message: "Error fetching url: \(err.localizedDescription)")
                    return
                }
                
                guard let url = url else {
                    alert.dismiss(animated: false, completion: nil)
                    self.showAlert(title: "Eror",message: "Error getting url")
                    return
                }
                
                let imgUrl = url.absoluteString
                
                //                let dbChildName = UUID().uuidString
                
                
                let dbRef = Database.database().reference().child("Movies").childByAutoId()
                
                
                let data = [
                    "Title" : Title,
                    "MovieYear" : MovieYear,
                    "Rating": Rating,
                    "imageUrl" : imgUrl,
                    
                ]
                
                dbRef.setValue(data, withCompletionBlock: { ( err , dbRef) in
                    if let err = err {
                        self.showAlert(title: "Eror",message: "Error uploading data: \(err.localizedDescription)")
                        return
                    }
                    alert.dismiss(animated: false, completion: nil)
                    
                    self.showAlert(title: "Success", message: "Movie data uploaded !")
//                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
//                    self.present(vc, animated: true, completion: nil)
                    
                    
                })
                
            }
        }
    }
    func showAlert(title:String,message:String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
}
