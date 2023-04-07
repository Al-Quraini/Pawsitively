//
//  SignupForm.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/7/23.
//

import SwiftUI

struct SignupForm: View {
    @State private var emailTex : String = ""
    @State private var password : String = ""
    var body: some View {
        VStack {
            Image(ImageConstant.pawIconText)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(ColorConstant.primary)
                .frame(minWidth: 225, idealWidth: 250, maxWidth: 275)
                .padding()
            
            Spacer().frame(maxHeight : 30)
            
            FloatingTextField(title: "Email", image: "mail-line", text: $emailTex)
                .padding(.horizontal, 20)
            FloatingTextField(title: "Password", image: "lock-line", text: $password)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            HStack {
                
                Button {
                    
                } label: {
                    Text("Your password must be at least 8 characters")
                        .font(.openSans(size: 12))
                        .foregroundColor(Color(.systemGray2))
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Spacer().frame(maxHeight: 50)
            ReusableButton(title: "Sign up", color: ColorConstant.primary, textColor: .white, icon: nil) {
                
            }
            Spacer().frame(maxHeight: 35)

            
            Text("Already have an accoutn? ")
                .font(.openSans(size: 15))
            + Text("Sign in here")
                .font(.openSans(size: 15))
                .foregroundColor(ColorConstant.primary)
        }
    }
}

struct SignupForm_Previews: PreviewProvider {
    static var previews: some View {
        SignupForm()
    }
}
