//
//  DataExtension.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        do {
            try? JSONDecoder().decode(T.self, from: self)
        } catch (let error) {
            print(error.localizedDescription)
        }
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
