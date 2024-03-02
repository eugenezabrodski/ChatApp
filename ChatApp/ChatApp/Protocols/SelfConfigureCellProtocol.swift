//
//  SelfConfigureCellProtocol.swift
//  ChatApp
//
//  Created by Eugene on 29/02/2024.
//

import UIKit

protocol SelfConfiguringCell {
    
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
    
}
