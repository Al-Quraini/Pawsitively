//
//  GuideTab.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/10/23.
//

import SwiftUI

struct GuideTab: View {
    @State private var navPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navPath) {
            List(0..<5) { i in
                Button {
                    navPath.append(1)
                } label: {
                        Image("dog-image")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .clipped()
                }
                .cornerRadius(10)
                .overlay {
                    ZStack(alignment: .bottomLeading) {
                        Rectangle().fill(.black)
                            .cornerRadius(10)
                            .opacity(0.3)
                        
                        Text("Dog")
                            .font(.openSans(size: 35, weight: .extraBold))
                            .foregroundColor(.white)
                            .padding(25)
                            .background(Rectangle().fill(.gray.opacity(0.5))
                                .frame(width: 220, height: 80)
                                .blur(radius: 25))
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .padding(.horizontal)
                .padding(.vertical, 8)

            }
            .listStyle(.inset)
            .navigationDestination(for: Int.self) { _ in
                 GuideDetail()
                
            }
            .navigationBarTitle("Guide")
        }
    }
}

struct GuideTab_Previews: PreviewProvider {
    static var previews: some View {
        GuideTab()
    }
}
