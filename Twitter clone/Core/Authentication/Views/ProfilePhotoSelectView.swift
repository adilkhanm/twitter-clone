//
//  ProfilePhotoSelectView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import SwiftUI

struct ProfilePhotoSelectView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title: "Creating an account\nUpload a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image("upload-photo")
                        .renderingMode(.template)
                        .resizable()
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 50)
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Utilities.getButtonText(withText: "Continue")
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
//
        content
            .foregroundColor(.blue)
            .scaledToFit()
            .frame(width: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectView()
    }
}
