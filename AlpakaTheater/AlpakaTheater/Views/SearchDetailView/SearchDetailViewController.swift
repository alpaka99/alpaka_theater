//
//  SearchDetailViewController.swift
//  AlpakaTheater
//
//  Created by user on 6/26/24.
//

import UIKit

final class SearchDetailViewController: BaseViewController {
    let searchDetailView = SearchDetailView()
    
    override func loadView() {
        view = searchDetailView
    }
    
    override func configureDelegate() {
        super.configureDelegate()
        
        searchDetailView.tableView.delegate = self
        searchDetailView.tableView.dataSource = self
    }
}

extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchDetailTableViewCell.identifier, for: indexPath) as? SearchDetailTableViewCell else {
            return UITableViewCell()
        }
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        
        cell.backgroundColor = .systemMint
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SearchDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath) as UICollectionViewCell
        
        cell.backgroundColor = .systemIndigo
        return cell
    }
    
    
}
