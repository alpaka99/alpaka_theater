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
    }
    
    override func layoutSubviews() {
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }
    
    internal func loadingImage() {
        activityIndicatorView.alpha = 1
        activityIndicatorView.startAnimating()
        
        posterImageView.alpha = 0
    }
    
    internal func setImage(_ image: UIImage) {
        activityIndicatorView.alpha = 0
        activityIndicatorView.stopAnimating()
        
        posterImageView.alpha = 1
        posterImageView.image = image
    }
}
