//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Alonso Alas on 30/10/22.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager{
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    // Public

    /// // Alonso: - Username and email is available
    /// parameters: email: String representing email, and username representing the username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// Insert new user data to database
    /// // Alonso: - Username and email is available
    /// parameters: email: String representing email, and username representing the username
    /// completion: Async callback for result if database entry succeeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool)->Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                //succeeded
                completion(true)
            } else {
                //failed
                completion(false)
            }
        }
    }
    
}
