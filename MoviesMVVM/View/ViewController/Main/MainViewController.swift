//
//  ViewController.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {

    var viewModel = MainViewModel()    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetch()
        loadAllFavoriteMovies()
    }    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies?.results?.count ?? 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2.1, height: collectionView.frame.size.width/2.1)
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "cell", for: indexPath as IndexPath) as! MoviesCollectionViewCell
        cell.setup(name: viewModel.movies?.results?[indexPath.item].title, imageURL: viewModel.movies?.results?[indexPath.item].backdrop_path)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        newViewController.movieDetail = viewModel.movies?.results?[indexPath.item]
        newViewController.modalPresentationStyle = .fullScreen
        present(newViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if viewModel.nextPage(indexPath: indexPath) {
            viewModel.page += 1
            viewModel.getmovies(url: "\(Constants.BASE_URL)\(Constants.API_KEY)&page=\(viewModel.page)")
        }
    }
}

extension MainViewController: MainProtocol {
    func reload() {
        collectionView.reloadData()
    }
}

