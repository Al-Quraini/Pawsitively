//
//  ResetPasswordForm.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/7/23.
//

import SwiftUI

struct ResetPasswordForm: View {
    @State private var emailText : String = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.backward")
                Text("Back")
                    .font(.openSans(size: 16,weight: .semiBold))
                
                Spacer()
            }
            .padding(20)
            
            Spacer().frame(maxHeight: 30)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Reset password")
                        .font(.openSans(size: 20,weight: .bold))
                    
                    Spacer().frame(maxHeight: 10)
                    Text("Enter the email associated with your account and we’ll send an email with instructions to reset your password.")
                        .font(.openSans(size: 15,weight: .regular))
                        .foregroundColor(Color(.systemGray2))
                }
                .padding(20)
                
                Spacer()
            }
            FloatingTextField(title: "Email", image: "mail-line", text: $emailText)
                .padding(20)
            Spacer()
            
            ReusableButton(title: "Send instructions", color: ColorConstant.primary, textColor: .white, icon: nil) {
                
            }
            .padding(.bottom, 45)
            .padding(.horizontal)
        }
    }
}

struct ResetPasswordForm_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordForm()
    }
}
