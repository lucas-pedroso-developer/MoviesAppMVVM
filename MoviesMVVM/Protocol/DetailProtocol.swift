//
//  DetailProtocol.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 10/09/21.
//

import Foundation

public protocol DetailProtocol {
    func fillFields()
    func showError(error: String)
    func hasExist(message: String)
    func saveSuccess(message: String)
}
