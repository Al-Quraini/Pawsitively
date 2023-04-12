//
//  RemindersTab.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/8/23.
//

import SwiftUI

struct RemindersTab: View {
    @State private var headerSize : CGSize = .zero
    @State private var showSheet : Bool = false
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 25) {
                    Spacer().frame(height: headerSize.height)
                    ForEach(0 ..< 5) { item in
                        ReminderItemAndTime()
                    }
                }
            }
            
            VStack {
                headerAndFilters
                Spacer()
            }
        }
    }
    
    private var headerAndFilters : some View {
        SizeReader(size: $headerSize) {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Spacer()
                        Text("Sunday April 2, 2023")
                            .font(.openSans(size: 14, weight: .semiBold))
                        Spacer()
                        Button {
                            showSheet = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .foregroundColor(ColorConstant.primary)
                        }
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                    
                    HStack(spacing: 15) {
                        ForEach(1..<8) { i in
                            VStack(spacing: 5) {
                                Text("Su")
                                    .font(.openSans(size: 14, weight: .light))
                                    .foregroundColor(.black.opacity(0.8))
                                Circle()
                                    .stroke(Color(.systemGray), lineWidth: 1)
                                    .frame(minWidth: 30, idealWidth: 35, maxWidth: 40)
                                    .background(Circle().fill(i == 7 ? ColorConstant.primary.opacity(0.5) : .clear))
                                    .overlay {
                                        Text("\(i)")
                                            .font(.openSans(size: 14))
                                    }
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
                .frame(height: 140)
                .background(ColorConstant.headerBackground)
                .background(ColorConstant.system)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< 5) { item in
                            SelectableReminderFilterButton(image: "parrot", name: "Douglas")
                        }
                    }
                    .padding(.horizontal)
                    .sheet(isPresented: $showSheet) {
                        AddReminderView()
                    }
                }
            }
        }
    }
}

struct RemindersTab_Previews: PreviewProvider {
    static var previews: some View {
        RemindersTab()
    }
}
