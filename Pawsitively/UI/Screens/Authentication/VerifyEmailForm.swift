//
//  VerifyEmailForm.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/7/23.
//

import SwiftUI

struct VerifyEmailForm: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.backward")
                Text("Back")
                    .font(.openSans(size: 16,weight: .semiBold))
                
                Spacer()
            }
            .padding(20)

            Spacer().frame(maxHeight: 75)
            
            Image("mail-verify")
                .padding(30)
            
            Text("Check your mail")
                .font(.openSans(size: 20,weight: .bold))
            
            Spacer().frame(maxHeight: 10)
            Text("We have sent a password recover instructions to your email")
                .font(.openSans(size: 13,weight: .regular))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.systemGray2))
                .frame(minWidth: 200, maxWidth: 250)
            
            Spacer().frame(maxHeight: 50)
            Spacer()
            
            ReusableButton(title: "Confirm", color: ColorConstant.primary, textColor: .white, icon: nil) {
                
            }
            .padding(.horizontal)
            
            VStack(spacing: 0) {
                Text("Did not receive the email? Check your spam")
                    .font(.openSans(size: 13, weight: .regular))
                
                Text("or")
                    .font(.openSans(size: 13, weight: .regular))
                
                + Text(" try another email address")
                    .font(.openSans(size: 13, weight: .regular))
                    .foregroundColor(ColorConstant.primary)
            }.padding(25)
                .padding(.bottom)
        }
    }
}

struct VerifyEmailForm_Previews: PreviewProvider {
    static var previews: some View {
        VerifyEmailForm()
    }
}
