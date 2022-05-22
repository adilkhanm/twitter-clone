//
//  NewTweetViewModel.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import Foundation

class NewTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withText text: String) {
        service.uploadTweet(text: text) { success in
            if success {
                self.didUploadTweet = true
            }
        }
    }
}
