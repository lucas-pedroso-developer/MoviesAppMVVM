//
//  DetailViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation
import CoreData

class DetailViewModel {
    
    var delegate: DetailProtocol?
    var stack = CoreDataStack.shared
        
    init() {
        
    }
    
    func saveFavoriteMovie(movieDetail: MoviesResult) {
        /*guard let id = movieDetail.id else { return delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente") }
        guard let name = movieDetail.title else { delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente") }
        guard let image = movieDetail.backdrop_path else { delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente") }
        guard let description = movieDetail.overview else { delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente") }
        guard let date = movieDetail.id else { delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente") }*/
        
        var id: Int = 0
        var name: String = ""
        var image: String = ""
        var description: String = ""
        var date: String = ""
        
        if let movieId = movieDetail.id {
            id = movieId
            if isExist(id: id) {
                delegate?.hasExist(message: "Esse filme já é um favorito!")
                return
            }
        } else {
            delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente")
        }
        
        if let movieName = movieDetail.title {
            name = movieName
        } else {
            delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente")
        }
        
        if let movieImage = movieDetail.backdrop_path {
            image = movieImage
        } else {
            delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente")
        }
        
        if let movieDescription = movieDetail.overview {
            description = movieDescription
        } else {
            delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente")
        }
        
        if let publicationDate = movieDetail.release_date {
            date = publicationDate
        } else {
            delegate?.showError(error: "Ocorreu um erro ao tentar salvar o filme nos favoritos! Tente mais tarde novamente")
        }
        _ = FavoriteMovie(
                           movieId: String(id),
                           movieName: name,
                           movieImage: image,
                           movieDescription: description,
                           publicationDate: String(date),
                           context: stack.viewContext)
        
        do {
            try stack.viewContext.save()
            delegate?.saveSuccess(message: "Filme favoritado com sucesso!")
        } catch {
            print("error")
        }
    }
    
    func isExist(id: Int) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteMovie")
        fetchRequest.predicate = NSPredicate(format: "movieId = %d", argumentArray: [id])
        
        let res = try! stack.viewContext.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
    
    func setFieldsData() {
        delegate?.fillFields()
    }
    
}
