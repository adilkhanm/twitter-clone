//
//  TweetCellView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct TweetCellView: View {
    @ObservedObject var viewModel: TweetCellViewModel
    
    init(tweet: Tweet) {
        self.viewModel = TweetCellViewModel(tweet: tweet)
    }
    
    var body: some View {
        if let user = viewModel.tweet.user {
            VStack {
                HStack(alignment: .top, spacing: 12) {
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        Utilities.getImage(fromUrl: user.profileImageUrl, width: 56, height: 56)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                
                        HStack(alignment: .center, spacing: 5) {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("· 2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.tweet.text)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        HStack(alignment: .center, spacing: 55) {
                            Button {
                                // comment
                            } label: {
                                Image(systemName: "bubble.left")
                                    .font(.subheadline)
                                
                                Text("0")
                                    .font(.caption)
                            }
                            
                            Button {
                                // something
                            } label: {
                                Image(systemName: "arrow.2.squarepath")
                                    .font(.subheadline)
                            }
                            
                            Button {
                                if viewModel.tweet.didLike ?? false {
                                    viewModel.unlikeTweet()
                                } else {
                                    viewModel.likeTweet()
                                }
                            } label: {
                                Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                                    .font(.subheadline)
                                    .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                                
                                Text(String(viewModel.tweet.likes))
                                    .font(.caption)
                            }
                            
                            Button {
                                // save
                            } label: {
                                Image(systemName: "bookmark")
                                    .font(.subheadline)
                            }
                        }
                        .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 3)
                
                Divider()
            }
        }
    }
}

//struct TweetCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetCellView()
//    }
//}
