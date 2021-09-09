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
}

extension MainViewController: MainProtocol {
    func reload() {
        collectionView.reloadData()
    }
}
