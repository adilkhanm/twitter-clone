//
//  UserService.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import Firebase

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                if let error = error {
                    print("DEBUG: failed to fetch user: \(error.localizedDescription)")
                    return
                }
                
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
                
//                print("INFO: user => \(user)")
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("DEBUG: failed to fetch users: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap({ try? $0.data(as: User.self) })
                
                completion(users)
            }
    }
}
