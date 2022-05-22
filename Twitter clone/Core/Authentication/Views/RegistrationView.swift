//
//  RegistrationView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title: "See what's happening in the world right now.")
            
            VStack(spacing: 40) {
                CustomInputFieldView(imageName: "envelope", placeholder: "Email", text: $email, isSecured: false)
                CustomInputFieldView(imageName: "person", placeholder: "Username", text: $username, isSecured: false)
                CustomInputFieldView(imageName: "person", placeholder: "Full name", text: $fullname, isSecured: false)
                CustomInputFieldView(imageName: "lock", placeholder: "Password", text: $password, isSecured: true)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            Button {
                viewModel.register(withEmail: email, username: username, fullname: fullname, password: password)
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
