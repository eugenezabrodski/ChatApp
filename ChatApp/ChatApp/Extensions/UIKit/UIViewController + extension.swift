//
//  UIViewController + extension.swift
//  ChatApp
//
//  Created by Eugene on 02/03/2024.
//

import UIKit

extension UIViewController {
    
    func configure<T: SelfConfiguringCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError() }
        cell.configure(with: value)
        return cell
    }
    
}
