//
//  ProfilePhotoForm.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/7/23.
//

import SwiftUI

struct ProfilePhotoForm: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.backward")
                Text("Back")
                    .font(.openSans(size: 16,weight: .semiBold))
                
                Spacer()
                
                Text("Skip")
                    .font(.openSans(size: 16,weight: .regular))
                    .foregroundColor(Color(.systemGray))
            }
            .padding(20)
            
            Spacer().frame(maxHeight: 30)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Add your profile photo")
                        .font(.openSans(size: 20,weight: .bold))
                    
                    Spacer().frame(maxHeight: 10)
                    Text("Your profile photo will be visible to other users")
                        .font(.openSans(size: 15,weight: .regular))
                        .foregroundColor(Color(.systemGray2))
                }
                .padding(20)
                
                Spacer()
            }
            
            ZStack {
                Circle()
                    .foregroundColor(Color(.systemGray4))
                
                Text("M")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button {
                        } label: {
                            Image("pen-background")
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                                .overlay {
                                    ZStack {
                                        Image("pencil-line")
                                        Circle()                                .stroke(.white, lineWidth: 4)
                                    }

                                }
                        }
                        .offset(y: -5)

                    }
                }
            }
            .frame(minWidth: 130, idealWidth: 160, maxWidth: 190,minHeight: 130, idealHeight: 160, maxHeight: 190)

            Spacer()
            
            ReusableButton(title: "Upload from library", color: ColorConstant.primary, textColor: .white, icon: "image-line") {
                
            }
            .padding(.horizontal)
            
            ReusableButton(title: "Take a photo", color: .white, textColor: .black, icon: "camera-line") {
                
            }
            .padding(.top, 10)
            .padding(.bottom, 45)
            .padding(.horizontal)
        }
    }
}

struct ProfilePhotoForm_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoForm()
    }
}
