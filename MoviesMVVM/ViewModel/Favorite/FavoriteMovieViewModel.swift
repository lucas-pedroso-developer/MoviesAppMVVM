//
//  FavoriteMovieViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 10/09/21.
//

import Foundation

public class FavoritemovieViewModel {
    
    var favoriteMovie: [FavoriteMovie]?
    var stack = CoreDataStack.shared
    var delegate: FavoriteProtocol?
    
    let handleFavoriteMovie = HandleFavoriteMovie()
    

    func loadAllFavoriteMovies() {
        do {
            try favoriteMovie = handleFavoriteMovie.fetchAllFavoriteMovies(entityName: FavoriteMovie.name, viewContext: stack.viewContext)
            delegate?.load()
        } catch(let error) {
            delegate?.showError(error: error.localizedDescription)
        }
    }
    
    func deleteFavoriteMovies(index: Int) -> Bool {
        do {
            return try handleFavoriteMovie.deleteFavoriteMovie(index: index, entityName: FavoriteMovie.name, viewContext: stack.viewContext)
            delegate?.load()
        } catch {
            delegate?.showError(error: error.localizedDescription)
        }
        return false
    }

    
}
