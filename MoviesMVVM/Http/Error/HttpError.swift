//
//  HttpError.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
