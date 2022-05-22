//
//  AuthHeaderView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import SwiftUI

struct AuthHeaderView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight], cornerRadii: CGSize(width: 80, height: 80)))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title: "Some Title!")
    }
}
