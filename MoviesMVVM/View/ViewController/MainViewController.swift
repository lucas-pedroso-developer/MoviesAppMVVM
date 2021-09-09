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
        viewModel.fetch()
    }


}

extension MainViewController: MainProtocol {
    func fetch() {
        collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.movies?.results?.count)
        return viewModel.movies?.results?.count ?? 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width //- padding
        return CGSize(width: collectionViewSize/2.1, height: collectionViewSize/2.1)
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "cell", for: indexPath as IndexPath) as! MoviesCollectionViewCell
        
        if let name = viewModel.movies?.results?[indexPath.item].title {
            cell.label.text = name
        }
        if let url = viewModel.movies?.results?[indexPath.item].backdrop_path {
            if let imageUrl = URL(string: url) {
                cell.imageView.kf.setImage(with: imageUrl)
            }
        }
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
                        
        return cell
    }
    
    

}
