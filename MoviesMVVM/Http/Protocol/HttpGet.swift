//
//  HttpGet.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import Foundation

public protocol HttpGet {
    func get(url: String, completion: @escaping (Result<Data?, HttpError>) -> ())
}
