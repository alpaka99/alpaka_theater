//
//  UICollectionViewLayout+Extension.swift
//  AlpakaTheater
//
//  Created by user on 6/25/24.
//
import UIKit

extension UICollectionViewLayout {
    static func flowLayout(spacing: CGFloat, numberOfCells: Int, heightMultiplier: CGFloat = 1.0 , scrollDirection: UICollectionView.ScrollDirection = .vertical) -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = scrollDirection
        flowLayout.minimumLineSpacing = spacing
        flowLayout.minimumLineSpacing = spacing
        flowLayout.sectionInset = UIEdgeInsets(
            top: spacing,
            left: spacing,
            bottom: spacing,
            right: spacing
        )
        let length = (ScreenSize.width - (flowLayout.sectionInset.left * 2) - (spacing * CGFloat(numberOfCells - 1))) / CGFloat(numberOfCells)
        flowLayout.itemSize = CGSize(width: length, height:  length * heightMultiplier)
        
        
        return flowLayout
    }
}
