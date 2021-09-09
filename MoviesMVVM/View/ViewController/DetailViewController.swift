//
//  DetailViewController.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
        
    var movieDetail: MoviesResult?
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescriptionTextView: UITextView!
    @IBOutlet weak var publicationDate: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFields()
    }
    
    private func fillFields() {
        if let movieName = self.movieDetail?.title {
            self.movieNameLabel.text = movieName
        } else {
            self.movieNameLabel.text = "No name"
        }
        
        if let movieDescription = self.movieDetail?.overview {
            self.movieDescriptionTextView.text = movieDescription
        } else {
            self.movieDescriptionTextView.text = "No description"
        }
                        
        if let publicationDate = self.movieDetail?.release_date {
            self.publicationDate.text = "Publication Date: \(publicationDate)"
        } else {
            self.movieDescriptionTextView.text = "No date"
        }
        
        if let backdrop_path = self.movieDetail?.backdrop_path {
            if let url = URL(string: "https://image.tmdb.org/t/p/w500" + backdrop_path) {
                self.movieImage.kf.setImage(with: url)
            }
        }
    }    
}

extension DetailViewController {
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 
    @IBAction func favorite(_ sender: UIButton) {
        
    }
}
