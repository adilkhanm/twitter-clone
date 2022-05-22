//
//  SideBarMenuView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI
import Kingfisher

struct SideBarMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading) {
                    Utilities.getImage(fromUrl: user.profileImageUrl, width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    UserStatisticsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                
                ForEach(SideBarMenuViewModel.allCases, id: \.rawValue) { viewModel in
                    switch viewModel {
                    case .profile:
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideBarMenuCellView(viewModel: viewModel)
                        }
                    case .logout:
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SideBarMenuCellView(viewModel: viewModel)
                        }
                    default:
                        Button {
                            print("button does not nothing yet!")
                        } label: {
                            SideBarMenuCellView(viewModel: viewModel)
                        }
                    }
                    
                }
                
                Spacer()
            }
        }
    }
}

struct SideBarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarMenuView()
    }
}
