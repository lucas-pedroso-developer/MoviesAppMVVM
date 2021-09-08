//
//  Movies.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import Foundation

struct Movies : Model {
    let status : String?
    let copyright : String?
    let has_more : Bool?
    let num_results : Int?
    let results : [Results]?
}
