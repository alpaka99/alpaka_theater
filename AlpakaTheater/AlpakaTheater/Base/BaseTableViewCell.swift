//
//  BaseTableViewCell.swift
//  AlpakaTheater
//
//  Created by user on 6/26/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell, CodeBaseBuildable {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
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
