//
//  ReusableButton.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/5/23.
//

import SwiftUI

struct ReusableButton: View {
    let title : String
    let color : Color
    let textColor : Color
    let icon : String?
    let action : () -> ()
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing : 15) {
                Text(title)
                    .font(.openSans(size: 18, weight: .semiBold))
                .foregroundColor(textColor)
                
                if let icon = icon {
                    Image(icon)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(textColor)
                        .frame(width: 25, height: 25)
                }
            }
        }
        .frame(minWidth: 300, idealWidth: 350, maxWidth: 400, minHeight: 40, idealHeight: 44, maxHeight: 50)
        .background(color)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ReusableButton_Previews: PreviewProvider {
    static var previews: some View {
        ReusableButton(title: "button", color: .blue, textColor: .white, icon: "camera-line", action: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
