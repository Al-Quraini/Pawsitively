//
//  FloatingLabelTextField.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/7/23.
//

import SwiftUI

struct FloatingTextField: View {
    let title: String
    let image : String?
    @Binding var text : String 
    @State private var hasText = false
    @State private var isEditing = false
    

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.systemGray3), lineWidth: 1)
            
            if hasText  {
                Text(title)
                    .font(.openSans(size: 18, weight: .light))
                    .foregroundColor(.clear)
                    .padding(10)
                    .background(ColorConstant.system)
                    .offset(x : image == nil ? 20 : 45 , y:  -25)
                    .scaleEffect(0.75, anchor: .leading)
            }
            Text(title)
                .foregroundColor(!hasText ? Color(.placeholderText) : ColorConstant.primary)
                .padding(10)
                .offset(x : image == nil ? 10 : 45  , y:  !hasText ? 0 : -25)
                .scaleEffect( !hasText ? 1 : 0.75, anchor: .leading)
            
                
            
            HStack {
                if let image = image {
                    Image(image)
                        .renderingMode(.template)
                        .foregroundColor(isEditing ? ColorConstant.primary : Color(.systemGray3))
                }
                TextField("", text: $text) { editing in
                    withAnimation {
                        self.isEditing = editing
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 45)
        .onChange(of: text) { _ in
               withAnimation {
                   hasText = !text.isEmpty
           }
        }
    }
}

struct FloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTextField(title: "Username", image: nil, text: .constant(""))
                .previewLayout(.sizeThatFits)
                .padding()
                .background(Color.white)
                .environment(\.colorScheme, .light)
    }
}
