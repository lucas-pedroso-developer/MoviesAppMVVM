//
//  Http.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import Foundation
import Alamofire

public class Http: HttpGet {
    public func get(url: String, completion: @escaping (Result<Data?, HttpError>) -> ()) {
        AF.request(url, method: .get).responseJSON { response in
            if let status = response.response?.statusCode {
                switch(status){
                    case 204:
                        completion(.success(nil))
                    case 200...299:
                        completion(.success(response.data))
                    case 401:
                        completion(.failure(.unauthorized))
                    case 403:
                        completion(.failure(.forbidden))
                    case 400...499:
                        completion(.failure(.badRequest))
                    case 500...599:
                        completion(.failure(.serverError))
                    default:
                        completion(.failure(.noConnectivity))
                }
            }
        }
    }
}

