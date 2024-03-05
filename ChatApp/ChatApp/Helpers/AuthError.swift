//
//  AuthError.swift
//  ChatApp
//
//  Created by Eugene on 05/03/2024.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidError
    case passwordsNotMached
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .invalidError:
            return NSLocalizedString("This format is unvailable", comment: "")
        case .passwordsNotMached:
            return NSLocalizedString("Passwords don't comfirm", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        }
    }
}
