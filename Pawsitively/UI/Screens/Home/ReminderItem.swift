//
//  ReminderItem.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/8/23.
//

import SwiftUI

struct ReminderItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack(spacing: 20)  {
                Image("parrot")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                
                Text("Douglas meal")
                    .font(.openSans(size: 16))
                Spacer()
            }.padding(.horizontal)
            
            Text("Feed Douglas some fruits and nuts")
                .font(.openSans(size: 12, weight: .light))
                .padding(.horizontal)
            
            HStack(spacing: 8) {
                Spacer()
                
                Text("00")
                    .font(.openSans(size: 12, weight: .semiBold))
                    .foregroundColor(.white)
                    .background {
                        Image("timer-background")
                    }
                
                Text(":")
                    .font(.openSans(size: 12, weight: .semiBold))
                
                Text("00")
                    .font(.openSans(size: 12, weight: .semiBold))
                    .foregroundColor(.white)
                    .background {
                        Image("timer-background")
                    }
                
                Text(":")
                    .font(.openSans(size: 12, weight: .semiBold))
                
                Text("00")
                    .font(.openSans(size: 12, weight: .semiBold))
                    .foregroundColor(.white)
                    .background {
                        Image("timer-background")
                    }
                
                Spacer()
            }
        }
        .frame(width: 280, height: 120)
        .padding(.vertical)
        .background{
            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.3)]), startPoint: .top, endPoint: .bottomTrailing)
        }
        .cornerRadius(10)
    }
}


struct ReminderItem_Previews: PreviewProvider {
    static var previews: some View {
        ReminderItem()
    }
}
