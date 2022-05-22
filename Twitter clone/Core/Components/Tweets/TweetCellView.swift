//
//  TweetCellView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct TweetCellView: View {
    var body: some View {
        
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .center, spacing: 5) {
                        Text("Adilkhan Muratov")
                            .font(.subheadline).bold()
                        
                        Text("@adilkhanm")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("· 2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Sometimes it seems so beautiful! Sometimes it seems so beautiful! Also some text is here to make the text wider! ")
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

struct TweetCellView_Previews: PreviewProvider {
    static var previews: some View {
        TweetCellView()
    }
}
