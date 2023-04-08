//
//  SmallButton.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/8/23.
//

import SwiftUI

struct SmallButton: View {
    let title : String
    var color : Color = ColorConstant.primary
    let action : () -> ()

    var body: some View {
        Button {
            
        } label: {
            HStack(spacing : 15) {
                Text(title)
                    .font(.openSans(size: 14, weight: .medium))
                    .foregroundColor(.white)

            }
        }
        .frame(minWidth: 95, idealWidth: 105, maxWidth: 115, minHeight: 28, idealHeight: 30, maxHeight: 32)
        .background(color)
        .cornerRadius(5)
        .shadow(radius: 5)
    }
}

struct SmallButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallButton(title: "verify", action: {})
    }
}
