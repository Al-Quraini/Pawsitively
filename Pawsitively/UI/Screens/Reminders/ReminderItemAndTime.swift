//
//  ReminderItemAndTime.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/9/23.
//

import SwiftUI

struct ReminderItemAndTime: View {
    var body: some View {
        HStack {
            Text("11:00 AM")
                .font(.openSans(size: 12, weight: .semiBold))
            
            Spacer()
            
            HStack(spacing: 15) {
                Image("parrot")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Food time for Douglas")
                        .font(.openSans(size: 14, weight: .semiBold))
                    
                    Text("It is time to feed Douglas some fruites and nuts")
                        .font(.openSans(size: 11, weight: .light))
                    
                }
                
                Image("checkmark")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.green)
                    .frame(width: 32, height: 32)
            }
            .padding()
            .frame(maxWidth: 320, minHeight: 75, maxHeight: 100)
            .background{
                LinearGradient(colors: [Color(hex: 0xD8DCE1, alpha: 1), .white], startPoint: .bottom, endPoint: .top)
            }
            .cornerRadius(15)
            .shadow(radius: 2)
        }
        .padding(.horizontal)
    }
}


struct ReminderItemAndTime_Previews: PreviewProvider {
    static var previews: some View {
        ReminderItemAndTime()
    }
}
