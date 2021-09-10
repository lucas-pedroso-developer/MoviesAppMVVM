//
//  DetailViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation

class DetailViewModel {
    
    var delegate: DetailProtocol?
    var stack = CoreDataStack.shared
        
    init() {
        
    }
    
    func saveFavoriteMovie(movieDetail: MoviesResult) {
        _ = FavoriteMovie(
                           movieName: (movieDetail.title)!,
                           movieImage: (movieDetail.backdrop_path)!,
                           movieDescription: (movieDetail.overview)!,
                           publicationDate: (movieDetail.release_date)!,
                           context: stack.viewContext)
        do {
            try stack.viewContext.save()
        } catch {
            print("error")
        }
    }
    
    func setFieldsData() {
        delegate?.fillFields()
    }
    
}
