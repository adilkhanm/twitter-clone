//
//  TweetCellViewModel.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 23.05.2022.
//

import Foundation

class TweetCellViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
        tweetIsLiked()
    }
    
    func likeTweet() {
        print("INFO: trying to like!")
        service.likeTweet(tweet) { success in
            if success {
                self.tweet.likes += 1
                self.tweet.didLike = true
            }
        }
    }
    
    func unlikeTweet() {
        print("INFO: trying to unlike!")
        service.unlikeTweet(tweet) { success in
            if success {
                self.tweet.likes -= 1
                self.tweet.didLike = false
            }
        }
    }
    
    func tweetIsLiked() {
        service.tweetIsLiked(tweet) { isLiked in
            self.tweet.didLike = isLiked
        }
    }

}
