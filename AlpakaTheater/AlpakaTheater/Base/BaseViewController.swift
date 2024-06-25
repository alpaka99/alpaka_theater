//
//  BaseViewController.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        configureDelegate()
    }
    
    internal func configureHierarchy() {
        
    }
    
    internal func configureLayout() {
        
    }
    
    internal func configureUI() {
        view.backgroundColor = .white
    }
    
    internal func configureDelegate() {
        
    }
}
