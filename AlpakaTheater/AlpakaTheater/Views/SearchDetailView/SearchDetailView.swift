//
//  SearchDetailView.swift
//  AlpakaTheater
//
//  Created by user on 6/26/24.
//

import UIKit

import SnapKit

final class SearchDetailView: BaseView {
    let movieTitleLabel = UILabel()
    let tableView = UITableView()
    
    
    override func configureHierarchy() {
        super.configureHierarchy()
        
        self.addSubview(movieTitleLabel)
        self.addSubview(tableView)
    }
    
    override func configureLayout() {
        super.configureLayout()
        
        movieTitleLabel.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(movieTitleLabel.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    override func configureUI() {
        super.configureUI()
        movieTitleLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        
        tableView.register(
            SearchDetailTableViewCell.self,
            forCellReuseIdentifier: SearchDetailTableViewCell.identifier
        )
    }
}
