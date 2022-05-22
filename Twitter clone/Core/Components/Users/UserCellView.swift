//
//  UserCellView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 15) {
            Utilities.getImage(fromUrl: user.profileImageUrl, width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 3)
    }
}

//struct UserCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCellView()
//    }
//}
