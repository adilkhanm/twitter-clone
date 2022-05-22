//
//  TweetService.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import Firebase

struct TweetService {
    
    static let collectionName = "tweets"
    
    func uploadTweet(text: String, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "text": text,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        
        Firestore.firestore().collection(TweetService.collectionName).document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: failed to tweet: \(error.localizedDescription)")
                    completion(false)
                } else {
                    completion(true)
                }
            }
    }
    
    func fetchTweets(completion: @escaping ([Tweet]) -> Void) {
        Firestore.firestore().collection(TweetService.collectionName).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
            completion(tweets)
        }
    }
    
}
