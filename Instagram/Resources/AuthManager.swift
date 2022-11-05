//
//  AuthManager.swift
//  Instagram
//
//  Created by Alonso Alas on 30/10/22.
//

import Foundation
import FirebaseAuth


public class AuthManager{
    static let shared = AuthManager()
    
    // Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        // check if username is available
        // check if email is available
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                // create account
                // insert account into database
                Auth.auth().createUser(withEmail: email, password: password){ result, error in
                    guard error == nil, result != nil else {
                        // Firebase Auth could not crate account
                        completion(false)
                        return
                    }
                    // Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) {inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            //fail to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                //either username or email does not exist
                completion(false)
                return
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping ((Bool)->Void)) {
        if let email = email {
            // Username Login
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                
            completion(true)
            }
        } else if let username = username {
            // Username Login
            print(username)
        }
    }
    
    ///// Alonso: - Attempt to log out firebase user
    public func logOut(completion: (Bool)->Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            completion(false)
            print(error)
            return
        }
    }
    
    
}
