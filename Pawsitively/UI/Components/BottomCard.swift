//
//  BottomCard.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/12/23.
//

import SwiftUI

struct BottomCard<Content:View>: View {
    @Binding var isPresented : Bool
    let height : CGFloat
    let content : Content
    
    init(isPresented: Binding<Bool>, height : CGFloat,  @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.3))
            .opacity(isPresented ? 1 : 0)
            .onTapGesture {
                withAnimation(.easeIn) {
                    self.isPresented.toggle()
                }
            }
            
            VStack(spacing: 0) {
                Spacer()
                
                VStack(spacing: 0) {
                    self.content
                    Spacer()
                }
                .frame(height: height)
                .background(.white)
                .cornerRadius(20)
                .offset(y:isPresented ? 0 : height)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BottomCard_Previews: PreviewProvider {
    static var previews: some View {
        BottomCard(isPresented: .constant(true), height: 300) {
            
        }
    }
}
