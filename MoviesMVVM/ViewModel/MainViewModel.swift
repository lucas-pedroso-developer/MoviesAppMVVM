//
//  MainViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import Foundation

public class MainViewModel {
    
    var movies: Movies?
    let http = Http()
    var delegate: MainProtocol?
    
    public init() {}
    
    func getmovies(url: String) {
        http.get(url: url) { result in
            switch result {
            case .success(let data):
                if data != nil {
                    self.movies = data?.toModel()                    
                } 
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
