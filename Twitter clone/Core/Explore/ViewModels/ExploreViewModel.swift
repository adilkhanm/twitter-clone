//
//  ExploreViewModel.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    let service = UserService()
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            return users.filter({
                $0.username.lowercased().contains(lowercasedQuery) || $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
