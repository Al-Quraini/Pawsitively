//
//  GuideDetail.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/10/23.
//

import SwiftUI

struct GuideDetail: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("dog-image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth,height: 300)
                    .clipped()
                
                
                ForEach(0 ..< 5) { item in
                    ParagraphView()
                }
                
                Spacer().frame(height: 50)
            }
            
        }
        .ignoresSafeArea()
        .navigationTitle("Dog")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GuideDetail_Previews: PreviewProvider {
    static var previews: some View {
        GuideDetail()
    }
}

struct ParagraphView: View {
    var body: some View {
        Group{
            Spacer().frame(height: 32)
            Text("About")
                .font(.openSans(size: 20, weight: .semiBold))
            
            Spacer().frame(height: 20)
            
            Text("Getting a dog as a pet can be a wonderful decision for many people. Dogs are known for being loyal, loving, and devoted see more")
                .font(.openSans(size: 14))
        }
        .padding(.horizontal)
    }
}
