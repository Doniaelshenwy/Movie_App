//
//  DetailsMovieViewController.swift
//  Movie_APP
//
//  Created by Donia Elshenawy on 09/05/2022.
//

import UIKit

class DetailsMovieViewController: UIViewController {

    @IBOutlet weak var imageDetails: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    var comingMsg : Movie?
    
    @IBOutlet weak var releaseYearLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = comingMsg?.title
        ratingLabel.text = "\((comingMsg?.rating)!)"
        releaseYearLabel.text = "\((comingMsg?.releaseYear)!)"
        let urlImg = URL(string: (comingMsg?.image)!)
        imageDetails.sd_setImage(with: urlImg, completed: nil)
    }
    

   

}
