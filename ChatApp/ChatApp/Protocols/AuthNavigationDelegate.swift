//
//  AuthNavigationDelegate.swift
//  ChatApp
//
//  Created by Eugene on 05/03/2024.
//

import Foundation

protocol AuthNavigatingDelegate: AnyObject {
    func toLoginVC()
    func toSignUpVC()
}
