//
//  BaseCollectionViewCell.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

import UIKit

import SnapKit

class BaseCollectionViewCell: UICollectionViewCell, CodeBaseBuildable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configureHierarchy() { }
    
    internal func configureLayout() { }
    
    internal func configureUI() { }
}
