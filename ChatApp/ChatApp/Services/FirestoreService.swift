//
//  FirestoreService.swift
//  ChatApp
//
//  Created by Eugene on 05/03/2024.
//

import UIKit
import Firebase
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, userName: String?, avatarImageString: String?, description: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(userName: userName, description: description, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        var mUser = MUser(username: userName!,
                          email: email,
                          description: description!,
                          sex: sex!,
                          avatarStringURL: "",
                          id: id)
        
        self.usersRef.document(mUser.id).setData(mUser.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(mUser))
            }
        }
        
        
    }
}
