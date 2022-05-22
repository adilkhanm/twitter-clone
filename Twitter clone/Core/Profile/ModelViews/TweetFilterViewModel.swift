//
//  TweetFilterViewModel.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & replies"
        case .likes: return "Likes"
        }
    }
}
