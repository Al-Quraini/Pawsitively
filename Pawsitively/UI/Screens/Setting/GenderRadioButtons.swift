//
//  GenderRadioButtons.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/12/23.
//

import SwiftUI


struct GenderRadioButtons: View {
    @State var selectedGender: Gender?
    
    var body: some View {
        HStack {
            RadioButtonView(labelText: "Male", isSelected: selectedGender == .male) {
                selectedGender = .male
            }
            
            RadioButtonView(labelText: "Female", isSelected: selectedGender == .female) {
                selectedGender = .female
            }
        }
    }
}

struct RadioButtonView: View {
    var labelText: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 20) {
                Circle()
                    .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                    .overlay(Circle().fill(isSelected ? ColorConstant.primary : .clear).frame(width: 12, height: 12))
                    .frame(width: 20, height: 20)
                
                Text(labelText)
                    .font(.openSans(size: 13))
                    .lineLimit(1)
                
                Spacer()
            }
        }
        .foregroundColor(.black)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
    }
}

enum Gender : String {
    case male, female
}

struct GenderRadioButtons_Previews: PreviewProvider {
    static var previews: some View {
        GenderRadioButtons()
    }
}
