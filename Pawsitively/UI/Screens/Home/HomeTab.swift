//
//  HomeTab.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/8/23.
//

import SwiftUI

struct HomeTab: View {
    @State private var headerSize : CGSize = .zero
    var body: some View {
        ZStack(alignment : .top) {
            ScrollView {
                VStack {
                    Spacer().frame(height: headerSize.height)
                    
                    HStack {
                        Text("Upcoming reminders")
                            .font(.openSans(size: 14, weight: .bold))
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach(0..<3) { i in
                                ReminderItem()
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        Text("Community")
                            .font(.openSans(size: 14, weight: .bold))
                        Spacer()
                    }
                    .padding()
                    
                    ForEach(0..<5) { i in
                        FeedItemView()
                        
                        Divider()
                            .padding(.horizontal)
                    }
                    Spacer()
                }
            }
            SizeReader(size: $headerSize) {
                VStack(spacing: 0) {
                    headerView
                    verifyEmailView
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image("pen-add")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .frame(width: 55, height: 55)
                            .padding(25)
                    }
                }
            }
            
        }
    }
    
    private var headerView : some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Welcome, John")
                    .font(.openSans(size: 22))
                
                HStack {
                    Image("map-pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12,height: 15)
                    Text("Boston, MA")
                        .font(.openSans(size: 14, weight: .light))
                        .underline()
                }
            }
            Spacer()
            Circle()
                .foregroundColor(.gray)
                .frame(width: 42, height: 42)
        }
        .padding()
        .background(ColorConstant.system)
    }
    
    private var verifyEmailView : some View {
        HStack {
            Text("Verify your email")
                .font(.openSans(size: 14))
                .foregroundColor(.white)
            
            Spacer()
            
            SmallButton(title: "Verify") {
                
            }
        }
        .padding()
        .background(ColorConstant.secondary.opacity(0.8))
    }
    
    private var noPetView : some View {
        Group {
            Text("You have not added any profile for your pets")
                .font(.openSans(size: 14, weight: .light))
                .foregroundColor(.black.opacity(0.7))
                .padding()
            
            SmallButton(title: "Add a pet", color: ColorConstant.secondary) {
                
            }
        }
    }
    
    private var noReminderView : some View {
        Group {
            Text("You hve no reminders")
                .font(.openSans(size: 14, weight: .light))
                .foregroundColor(.black.opacity(0.7))
            
            SmallButton(title: "Add a reminder", color: ColorConstant.secondary) {
                
            }
            .padding()
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}

