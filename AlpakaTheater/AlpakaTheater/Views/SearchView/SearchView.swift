//
//  SearchView.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

import UIKit

import SnapKit

final class SearchView: BaseView {
    private(set) var searchBar = UISearchBar()
    private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.flowLayout(spacing: 10, numberOfCells: 3, heightMultiplier: 1.3))
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.addSubview(searchBar)
        self.addSubview(collectionView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        searchBar.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(self.snp.height)
                .multipliedBy(0.1)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
