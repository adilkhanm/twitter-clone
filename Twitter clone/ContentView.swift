//
//  ContentView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var menuIsActive = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(menuIsActive)
            
            if menuIsActive {
                ZStack {
                    Color(.black)
                        .opacity(menuIsActive ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        menuIsActive = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideBarMenuView()
                .frame(width: 300)
                .offset(x: menuIsActive ? 0 : -300, y: 0)
                .background(menuIsActive ? Color.white : Color.clear)
        }
        .navigationTitle("Main")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        menuIsActive.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .onAppear() {
            menuIsActive = false
        }
    }
}
