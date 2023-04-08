//
//  CreatePostView.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/8/23.
//

import SwiftUI

struct CreatePostView: View {
    @State private var text : String = ""
    @State private var navBarSize : CGSize = .zero
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack {
                    Spacer().frame(height: navBarSize.height)
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Image("camera-line")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                        }
                        
                        Button {
                            
                        } label: {
                            Image("image-line")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                        }
                    }
                    .padding(20)
                    
                    HStack {
                        Circle()
                            .foregroundColor(.gray)
                        .frame(width: 45, height: 45)
                        
                        Spacer()
                    }
                    .padding()
                    
                    TextEditor(text: $text)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                        .overlay{
                            Color.gray.opacity(0.05)
                            if text.isEmpty {
                                HStack {
                                    VStack {
                                        Text("Enter text here")
                                            .font(.openSans(size: 15,weight: .regular))
                                            .foregroundColor(Color(.placeholderText))
                                            .padding(.leading, 20)
                                            .padding(.top, 10)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            }
                        }
                        .frame(height: 250)
                    
                }
            }
            SizeReader(size: $navBarSize) {
                HStack {
                    Image(systemName: "arrow.backward")
                    Text("Back")
                        .font(.openSans(size: 16,weight: .semiBold))
                    
                    Spacer()
                    
                    SmallButton(title: "post") {
                        
                    }
                }
                .padding(20)
                .background(ColorConstant.system)
            }
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
