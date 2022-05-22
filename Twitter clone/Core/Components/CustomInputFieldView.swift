//
//  CustomInputFieldView.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import SwiftUI

struct CustomInputFieldView: View {
    let imageName: String
    let placeholder: String
    @Binding var text: String
    let isSecured: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecured {
                    SecureField(placeholder, text: $text)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                } else {
                    TextField(placeholder, text: $text)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                    
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputFieldView(imageName: "envelope", placeholder: "Email", text: .constant(""), isSecured: false)
    }
}
