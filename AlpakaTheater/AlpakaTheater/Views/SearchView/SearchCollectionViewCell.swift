//
//  SearchCollectionViewCell.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

import UIKit

final class SearchCollectionViewCell: BaseCollectionViewCell {
    let activityIndicatorView = UIActivityIndicatorView()
    let posterImageView = UIImageView()
    
    override func configureHierarchy() {
        self.addSubview(activityIndicatorView)
        self.addSubview(posterImageView)
    }
    
    override func configureLayout() {
        activityIndicatorView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        posterImageView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
    
    override func configureUI() {
        activityIndicatorView.startAnimating()
        backgroundColor = .systemBlue
    }
    
    internal func setImage(_ image: UIImage) {
        posterImageView.image = image
    }
}
