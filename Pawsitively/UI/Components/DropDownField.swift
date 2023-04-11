//
//  DropDownField.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/9/23.
//

import SwiftUI

struct DropDownField: View {
    @State private var selection : String
    let items : [String]
    var action : (() -> ())?
    
    init(title: String, items : [String], action : (() -> ())? = nil) {
        self._selection = State(initialValue: title)
        self.items = items
    }
    
    var body: some View {
        if let action = self.action {
            Button {
                action()
            } label: {
                drowDownView
            }
        } else {
            Menu {
                ForEach(items, id: \.self) { item in
                    Button {
                        selection = item
                    } label: {
                     Text(item)
                            .font(.openSans(size: 12))
                    }
                }
            } label: {
                drowDownView
            }
        }
    }
    
    private var drowDownView : some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color(.systemGray), lineWidth: 0.5)
            .overlay(content: {
                HStack {
                    Text(selection)
                        .font(.openSans(size: 12, weight: .regular))
                        .lineLimit(1, reservesSpace: false)
                        .foregroundColor(.black.opacity(0.8))
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color(.systemGray))
                }
                .padding(.horizontal)
            })
            .frame(height: 45)
    }
}

struct DropDownField_Previews: PreviewProvider {
    static var previews: some View {
        DropDownField(title: "title", items: ["string"])
    }
}
