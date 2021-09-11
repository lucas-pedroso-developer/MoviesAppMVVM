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
    var viewModel = DetailViewModel()
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescriptionTextView: UITextView!
    @IBOutlet weak var publicationDate: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFavoriteButton()
        viewModel.delegate = self
        viewModel.setFieldsData()
    }
    
    func setupFavoriteButton() {
        let screenHeight = UIScreen.main.bounds.height
        favoriteButton.layer.cornerRadius = screenHeight*0.07/2
    }
}

extension DetailViewController: DetailProtocol {
    func fillFields() {
        if let movieName = self.movieDetail?.title {
            self.movieNameLabel.text = movieName
        }
        if let movieDescription = self.movieDetail?.overview {
            self.movieDescriptionTextView.text = movieDescription
        }
                        
        if let publicationDate = self.movieDetail?.release_date {
            self.publicationDate.text = "Data da Publicação: \(publicationDate)"
        }
        
        if let backdrop_path = self.movieDetail?.backdrop_path {
            if let url = URL(string: "https://image.tmdb.org/t/p/w500" + backdrop_path) {
                self.movieImage.kf.setImage(with: url)
            }
        }
    }
    
    func showError(error: String) {
        self.showAlert(title: "Erro", message: error)
    }
    
    func hasExist(message: String) {
        self.showAlert(title: "Aviso", message: message)
    }
    
    func saveSuccess(message: String) {
        self.showAlert(title: "Sucesso", message: message)
    }
}

extension DetailViewController {
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 
    @IBAction func favorite(_ sender: UIButton) {
        if let movie = movieDetail {
            viewModel.saveFavoriteMovie(movieDetail: movie)
        }
    }
}
