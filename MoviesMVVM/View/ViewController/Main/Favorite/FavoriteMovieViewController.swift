//
//  FavoriteMovie.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 10/09/21.
//

import Foundation
import UIKit

class FavoriteMovieViewController: UIViewController {
    
    var stack = CoreDataStack.shared
    let handleFavoriteMovie = HandleFavoriteMovie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func loadAllFavoriteMovies() -> [FavoriteMovie]? {
        var favoriteMovie: [FavoriteMovie]?
        do {
            try favoriteMovie = handleFavoriteMovie.fetchAllFavoriteMovies(entityName: FavoriteMovie.name, viewContext: stack.viewContext)
        } catch {
            return nil
        }
        return favoriteMovie
    }
    
}
