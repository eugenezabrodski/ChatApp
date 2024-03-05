//
//  Validators.swift
//  ChatApp
//
//  Created by Eugene on 05/03/2024.
//

import Foundation

class Validators {
    
    static func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let password = password,
              let confirmPassword = confirmPassword,
              let email = email,
              password != "",
              confirmPassword != "",
              email != "" else { return false }
        
        return true
    }
    
    static func isFilled(userName: String?, description: String?, sex: String?) -> Bool {
        guard let description = description,
              let sex = sex,
              let userName = userName,
              description != "",
              sex != "",
              userName != "" else { return false }
        
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailReg = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailReg)
    }
    
    static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
    
}
