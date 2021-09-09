//
//  Movies.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation

public struct Movies: Model {
    public var page : Int?
    public var total_results : Int?
    public var total_pages : Int?
    public var results : [MoviesResult]?
            
    public init (page: Int?, total_results : Int?, total_pages : Int?, results : [MoviesResult]?) {
        self.page = page
        self.total_results = total_results
        self.total_pages = total_pages
        self.results = results
    }
}
