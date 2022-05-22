//
//  SideBarMenuCellView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct SideBarMenuCellView: View {
    let viewModel: SideMenuBarViewModel
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideBarMenuCellView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarMenuCellView(viewModel: .profile)
    }
}
