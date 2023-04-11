//
//  SelectableReminderFilterButton.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/9/23.
//

import SwiftUI

struct SelectableReminderFilterButton: View {
    @State var isSelected : Bool = false
    let image : String
    let name : String
    var body: some View {
        Button {
            self.isSelected.toggle()
        } label: {
            ZStack {
                Capsule()
                    .fill( self.isSelected ? ColorConstant.primary.opacity(0.2) : Color(.systemGray5),
                           strokeBorder: self.isSelected ? ColorConstant.primary : .clear,
                           lineWidth: self.isSelected ? 1 : 0)
                    .frame(width: 120, height: 30)
                
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                    
                    Text(name)
                        .font(.openSans(size: 11))
                        .foregroundColor(.black.opacity(0.7))
                    
                    if self.isSelected {
                        Image("checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                    }
                }
                .padding()
            }
        }
    }
}


struct SelectableReminderFilterButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectableReminderFilterButton(image: "parrot", name: "Douglas")
    }
}
