//
//  NameForm.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/7/23.
//

import SwiftUI

struct NameForm: View {
    @State private var fNameText : String = ""
    @State private var lNameText : String = ""
    
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
                    Text("Enter your name")
                        .font(.openSans(size: 20,weight: .bold))
                    
                    Spacer().frame(maxHeight: 10)
                    Text("Enter your first and last name ")
                        .font(.openSans(size: 15,weight: .regular))
                        .foregroundColor(Color(.systemGray2))
                }
                .padding(20)
                
                Spacer()
            }
            
            HStack(spacing : 15) {
                FloatingTextField(title: "First",image: nil, text: $fNameText)
                FloatingTextField(title: "Last",image: nil, text: $lNameText)
            }.padding(20)

            Spacer()
            
            ReusableButton(title: "Next", color: ColorConstant.primary, textColor: .white, icon: nil) {
                
            }
            .padding(.bottom, 45)
        }
    }
}

struct NameForm_Previews: PreviewProvider {
    static var previews: some View {
        NameForm()
    }
}
