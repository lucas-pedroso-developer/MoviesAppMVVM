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
    let handleFavoriteMovie = HandleFavoriteMovie()

    private func loadAllFavoriteMovies() -> [FavoriteMovie]? {
        var favoriteMovie: [FavoriteMovie]?
        do {
            try favoriteMovie = handleFavoriteMovie.fetchAllFavoriteMovies(entityName: FavoriteMovie.name, viewContext: stack.viewContext)
        } catch {
            return nil
        }
        return favoriteMovie
    }
    
    private func deleteFavoriteMovies(index: Int) -> Bool {
        do {
            return try handleFavoriteMovie.deleteFavoriteMovie(index: index, entityName: FavoriteMovie.name, viewContext: stack.viewContext)
        } catch {
            print("erro")
        }
        return false
    }

    
}
