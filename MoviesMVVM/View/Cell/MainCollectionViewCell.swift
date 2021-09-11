//
//  MainCollectionViewCell.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation
import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var uiview: UIView!
    
    func setup(name: String?, imageURL: String?) {
        if let name = name {
            self.label.text = name
        }
        if let backdrop_path = imageURL {
            if let url = URL(string: "https://image.tmdb.org/t/p/w500" + backdrop_path) {
                self.imageView.kf.setImage(with: url)
            }
        }
    }
    
    private func setupBorder() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.uiview.layer.cornerRadius = 4
    }
    
}
