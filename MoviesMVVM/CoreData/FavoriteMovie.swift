//
//  FavoriteMovie.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation
import CoreData

@objc(FavoriteMovie)
public class FavoriteMovie: NSManagedObject {
    
    static let name = "FavoriteMovie"
    
    convenience init(movieName: String, movieImage: String, movieDescription: String, publicationDate: String, context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: FavoriteMovie.name, in: context) {
            self.init(entity: ent, insertInto: context)
            self.movieName = movieName
            self.movieImage = movieImage
            self.movieDescription = movieDescription
            self.publicationDate = publicationDate
        } else {
            fatalError("Unable to find Entity name!")
        }
    }
    
}
