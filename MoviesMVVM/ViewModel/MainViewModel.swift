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
            
    init() {
        
    }
    
    func fetch() {
        self.getmovies(url: "\(Constants.BASE_URL)\(Constants.API_KEY)")
    }
    
    func getmovies(url: String) {
        http.get(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    guard let data = data else { return }
                    self.movies = try JSONDecoder().decode(Movies.self, from: data)                    
                    self.delegate?.reload()
                } catch(let error) {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

