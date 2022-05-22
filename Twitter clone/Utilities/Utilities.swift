//
//  Utilities.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import SwiftUI
import Kingfisher

class Utilities {
    
    static func getButtonText(withText text: String) -> some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 340, height: 50)
            .background(Color(.systemBlue))
            .clipShape(Capsule())
            .padding()
    }
    
    static func getImage(fromUrl url: String, width: CGFloat, height: CGFloat) -> some View {
        KFImage(URL(string: url))
            .resizable()
            .scaledToFit()
            .background(Color.black)
            .frame(width: width, height: height)
            .clipShape(Circle())
    }
    
}
