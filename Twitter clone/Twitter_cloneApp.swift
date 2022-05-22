//
//  Twitter_cloneApp.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 21.05.2022.
//

import SwiftUI
import Firebase

@main
struct Twitter_cloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView() {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
