//
//  AuthViewModel.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    private var temporarySession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("INFO: current user session is \(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to sign in: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
            
    }
    
    func register(withEmail email: String, username: String, fullname: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed to register user: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.temporarySession = user
            
            let data = ["email": email,
                        "username": username,
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error {
                    print("DEBUG: failed to save user data: \(error.localizedDescription)")
                    return
                }
                
                print("INFO: user data was saved!")
                self.didAuthenticateUser = true
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
        
        self.didAuthenticateUser = false
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = temporarySession?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users").document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { error in
                    if let error = error {
                        print("DEBUG: failed to save profile image url: \(error)")
                        return
                    }
                    self.userSession = self.temporarySession
            }
        }
    }
}
