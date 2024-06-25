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
    private var movie = MovieData(title: "", backdrop_path: "", id: 0, genre_ids: [], original_title: "", overview: "", poster_path: "")
    private var results: [[MovieData]] = [
        [],
        []
    ]
    let dispatchGroup = DispatchGroup()
    
    override func loadView() {
        view = searchDetailView
    }
    
    override func configureDelegate() {
        super.configureDelegate()
        
        searchDetailView.tableView.delegate = self
        searchDetailView.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    private func fetchData() {
        TMDBManager.shared.fetchTMDBData(.similarMovies(movie.id)) {[weak self] tmdbResponse in
            self?.results[0] = tmdbResponse.results.filter {
                $0.poster_path != nil
            }
            self?.searchDetailView.tableView.reloadData()
        }
        
        TMDBManager.shared.fetchTMDBData(.recommendations(movie.id)) {[weak self] tmdbResponse in
            self?.results[1] = tmdbResponse.results.filter {
                $0.poster_path != nil
            }
            self?.searchDetailView.tableView.reloadData()
        }
    }
    
    internal func configureData(_ movie: MovieData) {
        self.movie = movie
        
        searchDetailView.movieTitleLabel.text = movie.title
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
        if indexPath.row == 0 {
            cell.tableViewCellTitle.text = "비슷한 영화"
        } else if indexPath.row == 1 {
            cell.tableViewCellTitle.text = "추천 영화"
        }
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.tag = indexPath.row
        
        cell.collectionView.reloadData()
        
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
        cell.loadImage()
        
        if let posterPath = data.poster_path {
            dispatchGroup.enter()
            DispatchQueue.global(qos: .userInteractive).async(group: dispatchGroup) {
                TMDBManager.shared.fetchImage(posterPath) { [weak self] image in
                    self?.dispatchGroup.leave()
                    
                    self?.dispatchGroup.notify(queue: .main) {
                        cell.setImage(image)
                    }
                }
            }
        }
        return cell
    }
    
    
}
