//
//  Models.swift
//  Instagram
//
//  Created by Alonso Alas on 10/11/22.
//

import Foundation

enum Gender {
    case male, female, other
}

struct User {
    let username: String
    let name: (first: String, last: String)
    let birthDay: Int
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType {
    case photo, video
}
///// Alonso: - Represent user post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL // either url or full resolution photo
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
}

struct PostLike {
    let username: String
    let postIdentifier: String
    
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
    
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdData: Date
    let likes: [CommentLike]
}
