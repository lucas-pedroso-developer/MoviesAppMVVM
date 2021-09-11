//
//  MainViewModel.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import Foundation

public class MainViewModel {
    
    var movies: Movies?
    var delegate: MainProtocol?
    var page: Int = 1
    
    let http = Http()
    
    init() {
        
    }
    
    func fetch() {
        self.getmovies(url: "\(Constants.BASE_URL)\(Constants.API_KEY)")
    }   
    
    public func getmovies(url: String) {
        if !Connectivity.isConnectedToInternet {
            delegate?.showError(error: "Sem Internet!")
        } else {
            http.get(url: url) { result in
                switch result {
                case .success(let data):
                    do {
                        guard let data = data else { return }
                        let results = try JSONDecoder().decode(Movies.self, from: data)
                        if self.movies == nil {
                            self.movies = results
                        } else {
                            if let result = results.results {
                                self.movies?.results?.append(contentsOf: result)
                            }
                        }
                        self.delegate?.reload()
                    } catch(let error) {
                        self.delegate?.showError(error: error.localizedDescription)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
            
    public func nextPage(indexPath: IndexPath) -> Bool {
        if indexPath.item == (movies?.results?.count)! - 4 {
            if ((movies?.page)! <= (movies?.total_pages)!) {
                return true
            }
        }
        return false
    }
    
    
}

