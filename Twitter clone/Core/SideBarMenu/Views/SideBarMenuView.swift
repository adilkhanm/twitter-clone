//
//  SideBarMenuView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct SideBarMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Adilkhan Muratov")
                        .font(.headline)
                    
                    Text("@adilkhanm")
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
                        ProfileView()
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

struct SideBarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarMenuView()
    }
}
