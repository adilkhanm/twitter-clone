//
//  Utilities.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import SwiftUI

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
    
}
