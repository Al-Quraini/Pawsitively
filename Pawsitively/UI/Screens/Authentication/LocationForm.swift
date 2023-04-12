//
//  LocationForm.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/7/23.
//

import SwiftUI

struct LocationForm: View {
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
                    Text("Your location")
                        .font(.openSans(size: 20,weight: .bold))
                    
                    Spacer().frame(maxHeight: 10)
                    Text("Enable your location to see surrounding users")
                        .font(.openSans(size: 15,weight: .regular))
                        .foregroundColor(Color(.systemGray2))
                }
                .padding(20)
                
                Spacer()
            }
            
            Image("location-enable")
                .clipShape(Circle())
            .frame(minWidth: 130, idealWidth: 160, maxWidth: 190,minHeight: 130, idealHeight: 160, maxHeight: 190)

            Spacer()
            
            ReusableButton(title: "Enable location", color: ColorConstant.primary, textColor: .white, icon: nil) {
                
            }
            .padding(.top, 10)
            .padding(.bottom, 45)
            .padding(.horizontal)
        }
    }
}

struct LocationForm_Previews: PreviewProvider {
    static var previews: some View {
        LocationForm()
    }
}
