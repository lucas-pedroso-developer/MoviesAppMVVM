//
//  FavoriteMovie.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 10/09/21.
//

import Foundation
import UIKit

class FavoriteMovieViewController: UIViewController {        
    
    var viewModel = FavoritemovieViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadAllFavoriteMovies()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadAllFavoriteMovies()
        self.tableView.reloadData()
    }
}

extension FavoriteMovieViewController: FavoriteProtocol {
    func load() {
        tableView.reloadData()
    }
    
    func showError(error: String) {
        self.showAlert(title: "Erro", message: error)
    }
}

extension FavoriteMovieViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movie = viewModel.favoriteMovie else { return 0 }
        return movie.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteMovieTableViewCell
        
        cell.movieName.text = viewModel.favoriteMovie?[indexPath.row].movieName
        cell.movieDescription.text = viewModel.favoriteMovie?[indexPath.row].movieDescription
        
        if let backdrop_path = viewModel.favoriteMovie?[indexPath.row].movieImage {
            if let url = URL(string: "https://image.tmdb.org/t/p/w500" + backdrop_path) {
                cell.movieImage.kf.setImage(with: url)
            }
        }
    
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height*17/100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        newViewController.movieDetail = MoviesResult(popularity: nil, vote_count: nil, video: nil, poster_path: nil, id: nil, adult: nil, backdrop_path: viewModel.favoriteMovie?[indexPath.row].movieImage, original_language: nil, original_title: nil, genre_ids: nil, title: viewModel.favoriteMovie?[indexPath.row].movieName, vote_average: nil, overview: viewModel.favoriteMovie?[indexPath.row].movieDescription, release_date: viewModel.favoriteMovie?[indexPath.row].publicationDate)
        newViewController.modalPresentationStyle = .fullScreen
        present(newViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let isDeleted = viewModel.deleteFavoriteMovies(index: indexPath.row)
            if isDeleted {
                viewModel.favoriteMovie?.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
            } else {
                self.showAlert(title: "Erro", message: "Ocorreu um erro ao tentar deletar o filme! Tente mais tarde novamente")
            }
        }
    }
}
