//
//  ProfileView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            editProfile
            
            userInfo
            
            filterBar
            
            filterBody
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
                        .offset(x: 1, y: 12)
                }

                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 36)
            }
        }
        .frame(height: 96)
    }
    
    var editProfile: some View {
        HStack {
            Spacer()
            
            Button {
                // edit profile
            } label: {
                Text("Edit profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
        .padding(.top, 5)
    }
     
    var userInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Adilkhan Muratov")
                .font(.title2).bold()
            
            Text("@adilkhanm")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Trying to clone twitter)")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 15) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Nur-Sultan, Kazakhstan")
                }
                HStack {
                    Image(systemName: "calendar")
                    Text("Joined May 21")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatisticsView()
            .padding(.vertical)
            
            
        }
        .padding(.horizontal)
    }
    
    var filterBar: some View {
        HStack(spacing: 0) {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { filterCase in
                VStack {
                    VStack {
                        let selected = selectedFilter == filterCase
                        Text(filterCase.title)
                            .font(.headline)
                            .fontWeight(selected ? .semibold : .regular)
                            .foregroundColor(selected ? .black : .gray)
                        
                        Capsule()
                            .foregroundColor(Color(selected ? .systemBlue : .clear))
                            .frame(height: 3)
                        
                    }
                    .fixedSize(horizontal: true, vertical: true)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = filterCase
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var filterBody: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self) { _ in
                    TweetCellView()
                }
            }
        }
    }
}
