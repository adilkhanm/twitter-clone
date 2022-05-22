//
//  TweetCellView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct TweetCellView: View {
    let tweet: Tweet
    
    var body: some View {
        if let user = tweet.user {
            VStack {
                HStack(alignment: .top, spacing: 12) {
                    Utilities.getImage(fromUrl: user.profileImageUrl, width: 56, height: 56)
//                    Circle()
//                        .frame(width: 56, height: 56)
//                        .foregroundColor(Color(.systemBlue))
                    
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
                        
                        Text(tweet.text)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        HStack(alignment: .center, spacing: 55) {
                            Button {
                                // comment
                            } label: {
                                Image(systemName: "bubble.left")
                                    .font(.subheadline)
                            }
                            
                            Button {
                                // something
                            } label: {
                                Image(systemName: "arrow.2.squarepath")
                                    .font(.subheadline)
                            }
                            
                            Button {
                                // like
                            } label: {
                                Image(systemName: "heart")
                                    .font(.subheadline)
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
