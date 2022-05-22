//
//  User.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
