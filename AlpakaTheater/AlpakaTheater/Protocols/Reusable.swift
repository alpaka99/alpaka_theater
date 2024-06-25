//
//  Reusable.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//

import UIKit

protocol Reusable { }

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Reusable { }
extension UITableViewCell: Reusable { }
