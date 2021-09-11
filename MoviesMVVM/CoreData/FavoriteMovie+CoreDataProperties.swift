//
//  FavoriteMovie+CoreDataProperties.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation
import CoreData

extension FavoriteMovie {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMovie> {
        return NSFetchRequest<FavoriteMovie>(entityName: "FavoriteMovie")
    }
    
    @NSManaged public var movieId: String?
    @NSManaged public var movieName: String?
    @NSManaged public var movieImage: String?
    @NSManaged public var movieDescription: String?
    @NSManaged public var publicationDate: String?
}

extension FavoriteMovie {
    
    @objc(addMoviesObject:)
    @NSManaged public func addToMovies(_ value: FavoriteMovie)
    
    @objc(removeMoviesObject:)
    @NSManaged public func removeFromMovies(_ value: FavoriteMovie)
    
    @objc(addMovies:)
    @NSManaged public func addToMovies(_ values: NSSet)
    
    @objc(removeMovies:)
    @NSManaged public func removeFromMovies(_ values: NSSet)
    
}
