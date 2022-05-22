//
//  MainTabView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .onTapGesture {
                    self.selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            ExploreView()
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            NotificationsView()
                .onTapGesture {
                    self.selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(2)
            
            MessagesView()
                .onTapGesture {
                    self.selectedTab = 3
                }
                .tabItem {
                    Image(systemName: "envelope")
                }
                .tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
