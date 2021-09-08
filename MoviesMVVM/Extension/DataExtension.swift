//
//  DataExtension.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
