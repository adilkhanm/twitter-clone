//
//  Tweet.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let text: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
}
