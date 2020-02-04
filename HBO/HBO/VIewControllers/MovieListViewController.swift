//
//  MovieListViewController.swift
//  HBO
//
//  Created by Suneth on 1/26/20.
//  Copyright © 2020 Suneth. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import SwiftyJSON
import FirebaseAuth
import Kingfisher

class MovieListViewController: UITableViewController{
    var UID: String?
    var MovieID = [String]()
//    var Movies:[Movie] = [Movie]()
    
    var items = [JSON](){
        didSet{
            tableView.reloadData()
        }
    }
    //var user : String?
    var userid : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "MovieTableViewCell")
        
        
        let ref = Database.database().reference().child("Movies")
        ref.observe(.value, with: { snapshot in
            self.items.removeAll()
            self.MovieID.removeAll()
            let dict = snapshot.value as? [String: AnyObject]
            let json = JSON(dict as Any)
//
            for object in json["UploadedMovies"]{
//                self.MovieID.append(object)
                self.items.append(object.1)
                print(object.1)
//                print(self.items)
            }
        })
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 580
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        cell.lblMovieName.text = items[indexPath.row]["Title"].stringValue
        cell.lblRatings.text = items[indexPath.row]["Rating"].stringValue
        
        
        cell.lblYear.text = items[indexPath.row]["MovieYear"].stringValue
        
        let imageURL = URL(string: items[indexPath.row]["imageUrl"].stringValue)
        cell.imgMovie.kf.setImage(with: imageURL)
        
//        cell.delegate = self
        
        return cell
    }
    
    //Shoulde be fixed as the requirement
    func showAlert(message:String)
    {
        
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    func nothingToShow(){
        let lable = UILabel(frame: .zero)
        lable.textColor = UIColor.darkGray
        lable.numberOfLines = 0
        lable.text = "No movies in the list"
        lable.textAlignment = .center
        tableView.separatorStyle = .none
        tableView.backgroundView = lable
    }
}
