//
//  MyPetsPage.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/12/23.
//

import SwiftUI

struct MyPetsPage: View {
    @Environment(\.dismiss) private var dismiss
    @State private var backButtonSize : CGSize = .zero
    @State private var navPath = NavigationPath()
    let listCount : Int = 3
    var body: some View {
        List(0..<listCount, id: \.self) { i in
            if i == listCount - 1 {
                HStack {
                    Spacer()
                    Button {
                        navPath.append(ProfileType.new)
                    } label: {
                        Text("Add new pet profile + ")
                            .font(.openSans(size: 18, weight: .semiBold))
                            .underline()
                            .foregroundColor(Color(hex: 0x979797))
                    }.buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }
                .listRowSeparator(.hidden)
                
            }
            else {
                SettingPetListItem()
                    .listRowSeparator(.hidden)
                
                Divider().listRowSeparator(.hidden)
            }
        }
        .navigationDestination(for: ProfileType.self) { profile in
            switch profile {
            case .edit : AddPetProfilePage()
            case .new : AddPetProfilePage()
            }
        }
        .listStyle(.inset)
        .navigationTitle("My pets")
        .navigationBarBackButtonHidden(true)
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
}

struct MyPetsPage_Previews: PreviewProvider {
    static var previews: some View {
        MyPetsPage()
    }
}

struct SettingPetListItem: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("parrot")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 65, height: 65)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Douglas")
                    .font(.openSans(size: 16, weight: .regular))
                
                Text("8 years old")
                    .font(.openSans(size: 12, weight: .regular))
            }
            
            Spacer()
            Button {
            } label: {
                Image("pen-edit")
                    .padding()
            }
        }
        .buttonStyle(PlainButtonStyle())
        .onTapGesture {return}
        .padding(.vertical,5)
    }
}

fileprivate enum ProfileType : Hashable {
    case edit
    case new
}
