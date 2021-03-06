//
//  MainProtocol.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 09/09/21.
//

import Foundation

public protocol MainProtocol {
    func reload()
    func showError(error: String)
    func showHideLoading(show: Bool)
}
    

