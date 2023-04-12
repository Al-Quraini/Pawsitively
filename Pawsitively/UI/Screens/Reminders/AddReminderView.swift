//
//  AddReminderView.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/9/23.
//

import SwiftUI

struct AddReminderView: View {
    @State private var headerSize : CGSize = .zero
    @State private var detailsText : String = ""
    @State private var currentTime : Date = Date()
    @State private var openSheet : Bool = false
    @State private var sheetObject : AddViewSheetType? = nil
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading) {
                    Spacer().frame(height: headerSize.height + 20)
                    
                    Group {
                        HStack {
                            Text("Set a reminder for")
                                .font(.openSans(size: 13))
                            Button {
                                sheetObject = .pet
                            } label: {
                                Image("add-square")
                            }
                            Spacer()
                        }.padding(.horizontal)
                        
                            Capsule()
                                .fill(ColorConstant.primary)
                                .overlay {
                                    HStack {
                                        Image("parrot")
                                            .resizable()
                                            .scaledToFill()
                                            .clipped()
                                            .frame(width: 22, height: 22)
                                            .clipShape(Circle())
                                        
                                        Text("Douglas")
                                            .font(.openSans(size: 12, weight: .semiBold))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                }
                            .frame(width: 120, height: 35)
                            .padding(.horizontal)
                            
                    }
                    Spacer().frame(height: 40)
                    
                    Group{
                        Text("For What")
                            .font(.openSans(size: 13))
                            .padding(.horizontal)
                        
                        HStack {
                            DropDownField(title: "Reminder of", items: ["food", "walk"])
                            DropDownField(title: "priority", items: ["low", "medium", "high"])
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer().frame(height: 40)

                    Group {
                        Text("Details")
                            .font(.openSans(size: 13))
                            .padding(.horizontal)
                        
                        TextEditor(text: $detailsText)
                            .font(.openSans(size: 12))
                            .frame(height: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 0.5)
                                    .opacity(0.3)
                            )
                            .padding(.horizontal)
                    }
                    
                    Spacer().frame(height: 40)

                    Group{
                        Text("When")
                            .font(.openSans(size: 13))
                            .padding(.horizontal)
                        
                        HStack {
                            DropDownField(title: "Select frequency", items: ["Daily", "Weekly"])
                            DropDownField(title: "Select week days", items: ["low", "medium", "high"]){
                                sheetObject = .days
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        Text("Select time:")
                            .font(.openSans(size: 13))
                        
                        DatePicker("", selection: $currentTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    .padding()
                }
                .sheet(item: $sheetObject) { sheet in
                    switch sheet {
                    case .pet:
                        EmptyView()
                    case .days:
                        EmptyView()
                    }
                }
                Spacer().frame(height: 40)
                ReusableButton(title: "Add +", color: ColorConstant.primary, textColor: .white, icon: nil) {
                    openSheet.toggle()
                }
            }
            
            
            SizeReader(size: $headerSize) {
                VStack(spacing: 0) {
                    HStack {
                        Text("Add reminder")
                            .font(.openSans(size: 25, weight: .bold))
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(.systemGray2))
                        }

                    }
                    .padding()
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 0.8)
                        .shadow(radius: 10, y: 3)
                }.background(ColorConstant.system)
            }
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
            .previewLayout(.sizeThatFits)
    }
}

enum AddViewSheetType : String, Identifiable {
    case pet
    case days
    var id: String {
        return self.rawValue
    }
    
}
