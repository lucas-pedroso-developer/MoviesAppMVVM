//
//  Connectivity.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 10/09/21.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
