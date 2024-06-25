//
//  SearchViewController.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

import UIKit

final class SearchViewController: BaseViewController {
    let searchView = SearchView()
    
    override func loadView() {
        self.view = searchView
    }
}
