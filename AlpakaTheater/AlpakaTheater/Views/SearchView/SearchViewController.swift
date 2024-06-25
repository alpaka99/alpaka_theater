//
//  SearchViewController.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

import UIKit

import Kingfisher

final class SearchViewController: BaseViewController {
    private let searchView = SearchView()
    private var searchResults: [MovieData] = [] {
        didSet {
            searchView.collectionView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = searchView
    }
    
    override func configureDelegate() {
        searchView.searchBar.delegate = self
        
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
        searchView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
        searchView.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
    }
}


extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            TMDBManager.shared.fetchTMDBData(.searchMovie(text)) { [weak self] tmdbResponse in
                self?.searchResults = tmdbResponse.results.filter {
                    $0.poster_path != nil
                }
            }
        }
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        
        cell.loadingImage()
        
        let data = searchResults[indexPath.row]
        if let posterPath = data.poster_path {
            TMDBManager.shared.fetchImage(posterPath) { image in
                print(type(of: image))
                cell.setImage(image)
            }
        }
        return cell
    }
}
