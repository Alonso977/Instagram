//
//  StoreManager.swift
//  Instagram
//
//  Created by Alonso Alas on 30/10/22.
//

import Foundation
import FirebaseStorage

public class StoreManager{
    static let shared = StoreManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    // Public
    
    public func uploadUserPhotoPost(model: UserPost, completion: @escaping (Result<URL, Error>)->Void) {
        
    }
    
    public func dowloadImage(widt reference: String, completion: @escaping (Result<URL, IGStorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL(completion: {url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))
        })
    }
    
}


