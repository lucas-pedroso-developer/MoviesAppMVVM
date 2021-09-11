//
//  HandleFavoriteMovie.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation
import CoreData

class HandleFavoriteMovie {
    func fetchAllFavoriteMovies(_ predicate: NSPredicate? = nil, entityName: String, sorting: NSSortDescriptor? = nil, viewContext: NSManagedObjectContext) throws -> [FavoriteMovie]? {
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fr.predicate = predicate
        if let sorting = sorting {
            fr.sortDescriptors = [sorting]
        }
        guard let favoriteMovie = try viewContext.fetch(fr) as? [FavoriteMovie] else {
            return nil
        }
        return favoriteMovie
    }
    
    func deleteFavoriteMovie(index: Int, _ predicate: NSPredicate? = nil, entityName: String, sorting: NSSortDescriptor? = nil, viewContext: NSManagedObjectContext) throws -> Bool {
            let fr = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            fr.predicate = predicate
            if let sorting = sorting {
                fr.sortDescriptors = [sorting]
            }
            guard let favoriteMovie = try viewContext.fetch(fr) as? [FavoriteMovie] else {
                return false
            }
        
            viewContext.delete(favoriteMovie[index])
            do {
                
                try viewContext.save()
            } catch {
                return false
            }
            return true
    }
    
    
    /*func isExist(id: Int) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteMovie")
        fetchRequest.predicate = NSPredicate(format: "id = %d", argumentArray: id)

        let res = try! stack.viewContext.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }*/
}
