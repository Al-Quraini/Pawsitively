//
//  AddProfileScreen.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/12/23.
//

import SwiftUI

struct AddPetProfilePage: View {
    @State private var name : String = ""
    @State private var age : String = ""
    @State private var details : String = ""
    @State private var breed : String = ""
    @State private var medicalCondition : String = ""
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Spacer().frame(height: 25)
                profileImage
                Spacer().frame(height: 20)
               Group {
                    FloatingTextField(title: "Pet name", image: nil, text: $name)
                    FloatingTextField(title: "Pet age", image: nil, text: $age)
                    TextEditor(text: $details)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                        .overlay{
                            if details.isEmpty {
                                HStack {
                                    VStack {
                                        Text("Enter text here")
                                            .font(.openSans(size: 15,weight: .regular))
                                            .foregroundColor(Color(.placeholderText))
                                            .padding(.leading, 20)
                                            .padding(.top, 10)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            }
                        }
                        .frame(height: 150)
                   
                   GenderRadioButtons(selectedGender: .female)
                   Group {
                       DropDownField(title: "Pet type", items: ["cat", "dog", "bird", "fish", "hamster", ])
                   }
                   .onTapGesture {
                       print("hello")
                   }
//                       .disabled(true)
                    FloatingTextField(title: "Pet breed", image: nil, text: $breed)
                    FloatingTextField(title: "Pet medical condition", image: nil, text: $medicalCondition)
                }
                
                Spacer().frame(height: 25)

                
                ReusableButton(title: "Add +", color: ColorConstant.primary, textColor: .white, icon: nil) {

                }

            }
            .padding(.horizontal, 25)
            .padding(.bottom, 35)
        }
        .navigationTitle("Pet profile")
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarItems(leading:
                                Button(action: {
            // Code to handle back button tap
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
            Image("paw-icon")
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

struct AddPetProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        AddPetProfilePage()
    }
}

