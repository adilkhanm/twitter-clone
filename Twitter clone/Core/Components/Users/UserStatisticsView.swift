//
//  UserStatisticsView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct UserStatisticsView: View {
    var body: some View {
        HStack(spacing: 15) {
            HStack(spacing: 5) {
                Text("14")
                    .font(.subheadline)
                    .bold()
                Text("following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack(spacing: 5) {
                Text("4")
                    .font(.subheadline)
                    .bold()
                Text("followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatisticsView()
    }
}
