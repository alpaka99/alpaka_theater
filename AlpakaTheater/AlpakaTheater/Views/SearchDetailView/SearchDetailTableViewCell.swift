//
//  SearchDetailTableViewCell.swift
//  AlpakaTheater
//
//  Created by user on 6/26/24.
//

import UIKit

final class SearchDetailTableViewCell: BaseTableViewCell {
    let tableViewCellTitle = UILabel()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    func layout() -> UICollectionViewLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 80, height: 120)
        
        return flowLayout
    }
    
    override func configureHierarchy() {
        self.contentView.addSubview(tableViewCellTitle)
        self.contentView.addSubview(collectionView)
    }
    
    override func configureLayout() {
        tableViewCellTitle.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.contentView)
            $0.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(tableViewCellTitle.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(self.contentView)
            $0.height.equalTo(120)
        }
    }
    
    override func configureUI() {
        tableViewCellTitle.text = "테스트 타이틀"
        
        collectionView.backgroundColor = .systemBlue
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
    }
}
