//
//  ViewController.swift
//  MoviesMVVM
//
//  Created by Lucas Daniel on 08/09/21.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }


}

extension MainViewController: MainProtocol {
    func fetch() {
        print("reload data")
    }
}
