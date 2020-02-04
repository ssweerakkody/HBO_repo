//
//  MovieTableViewCell.swift
//  HBO
//
//  Created by Suneth on 1/26/20.
//  Copyright © 2020 Suneth. All rights reserved.
//


import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblMovieName: UILabel!
    
    @IBOutlet weak var lblRatings: UILabel!
    
    @IBOutlet weak var lblYear: UILabel!
    
    
    @IBOutlet weak var imgMovie: UIImageView!
    

//    weak internal var delegate: MovieTableViewCelldelegate?
//
//    internal protocol MovieTableViewCelldelegate : AnyObject {
//
//        func avatarTableViewCell(_ MovieTableViewCell: MovieTableViewCell, avatarButtonTappedFor user: String)
//    }

}
