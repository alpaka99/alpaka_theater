//
//  SearchDetailViewController.swift
//  AlpakaTheater
//
//  Created by user on 6/26/24.
//

import UIKit

import Kingfisher

final class SearchDetailViewController: BaseViewController {
    private let searchDetailView = SearchDetailView()
    private var movie = MovieData(backdrop_path: "", id: 0, genre_ids: [], original_title: "", overview: "", poster_path: "")
    private var results: [[MovieData]] = [
        [],
        []
    ]
    
    override func loadView() {
        view = searchDetailView
    }
    
    override func configureDelegate() {
        super.configureDelegate()
        
        searchDetailView.tableView.delegate = self
        searchDetailView.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
    }
    
    func fetchData() {
        TMDBManager.shared.fetchTMDBData(.similarMovies(123)) {[weak self] tmdbResponse in
            self?.results[0] = tmdbResponse.results.filter {
                $0.poster_path != nil
            }
            self?.searchDetailView.tableView.reloadData()
            print(self?.results[0].count)
        }
        
        TMDBManager.shared.fetchTMDBData(.recommendations(123)) {[weak self] tmdbResponse in
            self?.results[1] = tmdbResponse.results.filter {
                $0.poster_path != nil
            }
            self?.searchDetailView.tableView.reloadData()
            print(self?.results[1].count)
        }
    }
}

extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchDetailTableViewCell.identifier, for: indexPath) as? SearchDetailTableViewCell else {
            return UITableViewCell()
        }
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.tag = indexPath.row
        
        cell.collectionView.reloadData()
        cell.backgroundColor = .systemMint
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SearchDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchDetailCollectionViewCell.identifier, for: indexPath) as? SearchDetailCollectionViewCell else { return UICollectionViewCell() }
        
        let data = results[collectionView.tag][indexPath.row]
        
        if let posterPath = data.poster_path {
            TMDBManager.shared.fetchImage(posterPath) { image in
                cell.posterImageView.image =  image
            }
        }
//          
        cell.backgroundColor = .systemIndigo
        return cell
    }
    
    
}
