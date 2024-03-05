//
//  UserError.swift
//  ChatApp
//
//  Created by Eugene on 05/03/2024.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExcist
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")        
        case .photoNotExcist:
            return NSLocalizedString("Choose photo", comment: "") 
        }
    }
}
