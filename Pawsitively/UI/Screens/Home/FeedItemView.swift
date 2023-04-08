//
//  FeedItemView.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/8/23.
//

import SwiftUI

struct FeedItemView: View {
    var image : String? = nil
    var body: some View {
        HStack(alignment: .top,spacing : 20) {
            Circle()
                .foregroundColor(.gray)
                .frame(width: 45, height: 45)
            
            VStack(alignment : .leading, spacing: 10) {
                Text("Jessica Jones")
                    .font(.openSans(size: 14, weight: .bold))
                
                Text("My dog likes playing on the ground, and messes arouond everything")
                    .font(.openSans(size: 12, weight: .regular))
                +
                Text("\t7h")
                    .font(.openSans(size: 12, weight: .regular))
                    .foregroundColor(.gray)
                
                if let image = image {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 200, idealWidth: 275, maxWidth: 350, minHeight: 120, idealHeight: 150, maxHeight: 180, alignment: .center)
                        .clipped()
                        .cornerRadius(5)
                }
            }
            Spacer()
            
            VStack(spacing : 20) {
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(Angle(degrees: 90))
                        .foregroundColor(.gray)
                }
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}

struct FeedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeedItemView()
    }
}
