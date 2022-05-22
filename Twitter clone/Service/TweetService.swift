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
        Firestore.firestore().collection(TweetService.collectionName)
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                
                let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
                completion(tweets)
            }
    }
    
    func fetchTweets(forUid uid: String, completion: @escaping ([Tweet]) -> Void) {
        Firestore.firestore().collection(TweetService.collectionName)
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                
                let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
                completion(tweets.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            }
    }
    
    func fetchTweet(forUid uid: String, completion: @escaping (Tweet) -> Void) {
        Firestore.firestore().collection(TweetService.collectionName)
            .document(uid)
            .getDocument { snapshot, error in
                if let error = error {
                    print("DEBUG: failed to fetch the tweet with id: \(error.localizedDescription)")
                    return
                }
                
                guard let tweet = try? snapshot?.data(as: Tweet.self) else { return }
                completion(tweet)
            }
    }
}



extension TweetService {
    
    func likeTweet(_ tweet: Tweet, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid,
              let tweetId = tweet.id else { return }
        
        let userLikesRef = Firestore.firestore().collection(UserService.collectionName).document(uid).collection(UserService.likesCollectionName)
        let tweetRef = Firestore.firestore().collection(TweetService.collectionName).document(tweetId)
        
        tweetRef.updateData(["likes": tweet.likes + 1]) { error in
            if let error = error {
                print("DEBUG: failed to update like the tweet: \(error.localizedDescription)")
                completion(false)
                return
            }
            userLikesRef.document(tweetId).setData([:]) { error in
                if let error = error {
                    print("DEBUG: failed to update like the tweet: \(error.localizedDescription)")
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }
    
    func unlikeTweet(_ tweet: Tweet, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid,
              let tweetId = tweet.id,
              tweet.likes > 0 else { return }
        
        let userLikesRef = Firestore.firestore().collection(UserService.collectionName).document(uid).collection(UserService.likesCollectionName)
        let tweetRef = Firestore.firestore().collection(TweetService.collectionName).document(tweetId)
        
        tweetRef.updateData(["likes": tweet.likes - 1]) { error in
            if let error = error {
                print("DEBUG: failed to unlike the tweet: \(error.localizedDescription)")
                completion(false)
                return
            }
            userLikesRef.document(tweetId).delete() { error in
                if let error = error {
                    print("DEBUG: failed to unlike the tweet: \(error.localizedDescription)")
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }
    
    func tweetIsLiked(_ tweet: Tweet, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid,
              let tweetId = tweet.id else { return }
        
        Firestore.firestore().collection(UserService.collectionName)
            .document(uid)
            .collection(UserService.likesCollectionName)
            .document(tweetId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
    
    func fetchLikedTweets(forUid uid: String, completion: @escaping ([Tweet]) -> Void) {
        var tweets = [Tweet]()
        
        Firestore.firestore().collection(UserService.collectionName)
            .document(uid)
            .collection(UserService.likesCollectionName)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("DEBUG: failed to fetch liked tweets: \(error.localizedDescription)")
                    return
                }
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { document in
                    let tweetId = document.documentID
                    self.fetchTweet(forUid: tweetId) { tweet in
                        tweets.append(tweet)
                        
                        completion(tweets)
                    }
                }
            }
    }
}
