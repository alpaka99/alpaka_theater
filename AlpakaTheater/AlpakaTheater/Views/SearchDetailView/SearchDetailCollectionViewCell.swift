//
//  SearchDetailCollectionViewCell.swift
//  AlpakaTheater
//
//  Created by user on 6/26/24.
//

import UIKit

final class SearchDetailCollectionViewCell: BaseCollectionViewCell {
    let posterImageView = UIImageView()
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.contentView.addSubview(posterImageView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        posterImageView.snp.makeConstraints {
            $0.edges.equalTo(self.contentView)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }
}
