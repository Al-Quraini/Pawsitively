//
//  InitialScreen.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/5/23.
//

import SwiftUI

struct InitialScreen: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ZStack {
                    ColorConstant.primary.opacity(0.75)
                        .frame(width: proxy.size.width * 1.3)
                        .background {
                            Image(ImageConstant.animals)
                                .resizable()
                                .scaledToFill()
                                .offset(y : -30)
                        }
                        .clipShape(CustomShape(corner: .bottomLeft, radii: 250))
                        .clipShape(CustomShape(corner: .bottomRight, radii: 200))
                        .offset(x: 20)
                    .ignoresSafeArea()
                    
                    Image(ImageConstant.pawIconText)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 275, idealWidth: 300, maxWidth: 325)
                        .padding(100)
                        .offset(y: -25)
                }
                .frame(width: proxy.size.width, height: proxy.size.height * 0.55)

                Spacer().frame(maxHeight: 80)
                ReusableButton(title: "Sign in", color: ColorConstant.secondary, textColor: .white, icon: nil) {

                }
                
                Spacer().frame(maxHeight: 20)
                
                ReusableButton(title: "Sign up", color: ColorConstant.system, textColor: .black, icon: nil) {
                    
                }
                
            }
        }
    }
}

struct InitialScreen_Previews: PreviewProvider {
    static var previews: some View {
        InitialScreen()
    }
}
