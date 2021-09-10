//
//  FavoriteProtocol.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 10/09/21.
//

import Foundation

public protocol FavoriteProtocol {
    func load()
    func showError(error: String)
}
