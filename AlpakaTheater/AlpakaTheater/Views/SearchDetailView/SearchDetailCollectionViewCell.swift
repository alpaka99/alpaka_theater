//
//  SearchDetailCollectionViewCell.swift
//  AlpakaTheater
//
//  Created by user on 6/26/24.
//

import UIKit

final class SearchDetailCollectionViewCell: BaseCollectionViewCell {
    private let posterImageView = UIImageView()
    private let activityIndicatorView = UIActivityIndicatorView()
    
    override func prepareForReuse() {
        posterImageView.image = nil
        
        loadImage()
    }
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.contentView.addSubview(posterImageView)
        self.contentView.addSubview(activityIndicatorView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        posterImageView.snp.makeConstraints {
            $0.edges.equalTo(self.contentView)
        }
        
        activityIndicatorView.snp.makeConstraints {
            $0.edges.equalTo(self.contentView)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }
    
    func setImage(_ image: UIImage) {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.alpha = 0
        
        posterImageView.alpha = 1
        posterImageView.image = image
    }
    
    func loadImage() {
        activityIndicatorView.alpha = 1
        activityIndicatorView.startAnimating()
        
        posterImageView.alpha = 0
    }
}
