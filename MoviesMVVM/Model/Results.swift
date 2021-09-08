//
//  Results.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import Foundation

struct Results : Model {
    let display_title : String?
    let mpaa_rating : String?
    let critics_pick : Int?
    let byline : String?
    let headline : String?
    let summary_short : String?
    let publication_date : String?
    let opening_date : String?
    let date_updated : String?
    let link : Link?
    let multimedia : Multimedia?
}
