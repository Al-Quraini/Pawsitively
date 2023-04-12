//
//  SettingProfilePage.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/12/23.
//

import SwiftUI

struct SettingProfilePage: View {
    @Environment(\.dismiss) private var dismiss
    @State private var fName : String = ""
    @State private var lName : String = ""
    @State private var email : String = ""
    var body: some View {
        VStack(spacing: 20) {
            Spacer().frame(height: 25)
            profileImage
            Spacer().frame(height: 15)
            
            HStack(spacing: 15) {
                FloatingTextField(title: "First name", image: nil, text: $fName)
                FloatingTextField(title: "Last name", image: nil, text: $lName)
            }
            
            FloatingTextField(title: "Last name", image: nil, text: $lName)
            
            Spacer()
            
            ReusableButton(title: "Save", color: ColorConstant.secondary, textColor: .white, icon: nil) {
                
            }
            
            Button {
                
            } label: {
                Text("Delete account")
                    .font(.openSans(size: 18, weight: .semiBold))
                    .foregroundColor(.red)
            }
            .padding(.top, 10)
            .padding(.bottom, 45)
            .padding(.horizontal)

        }
        .padding(.horizontal, 25)
        .navigationTitle("Profile")
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarItems(leading:
                                Button(action: {
            dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.backward")
                Text("Back")
                    .font(.openSans(size: 16, weight: .semiBold))
            }
            .foregroundColor(.black)
        })
    }
    
    
    private var profileImage : some View {
        ZStack(alignment: .bottomTrailing) {
            Image("")
                .frame(width: 50, height: 50)
                .padding()
                .frame(width: 120, height: 120)
                .background(Color(hex: 0xD9D9D9))
                .clipShape(Circle())
            
            Button {
                
            } label: {
                Image("pen-circle-button")
                    .resizable()
                    .scaledToFit()
                    .overlay(Circle()
                        .stroke(ColorConstant.system, lineWidth: 2))
                    .frame(width: 35, height: 35)
            }
            
        }.padding()
    }
}

struct SettingProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        SettingProfilePage()
    }
}
