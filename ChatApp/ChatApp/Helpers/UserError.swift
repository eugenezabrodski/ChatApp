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
    case cannotGetUserInfo
    case cannotUnwrapToMUser
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")        
        case .photoNotExcist:
            return NSLocalizedString("Choose photo", comment: "") 
        case .cannotGetUserInfo:
            return NSLocalizedString("Not user with this ID", comment: "")
        case .cannotUnwrapToMUser:
            return NSLocalizedString("Cannot convert", comment: "")
        }
    }
}
