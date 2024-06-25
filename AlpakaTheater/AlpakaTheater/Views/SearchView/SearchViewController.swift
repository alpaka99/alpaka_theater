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
    
    override func configureDelegate() {
        searchView.searchBar.delegate = self
        
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
        searchView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
    }
}


extension SearchViewController: UISearchBarDelegate {
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath) as UICollectionViewCell
        cell.backgroundColor = .systemBlue
        return cell
    }
}
