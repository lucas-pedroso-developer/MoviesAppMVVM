//
//  Genre.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation

public struct Genre: Model {
    public let id: Int?
    public let name: String?
    
    public init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
