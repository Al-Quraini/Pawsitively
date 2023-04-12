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
    @State private var showBottomCard : Bool = false
    @State private var cardDismissal : Bool = false
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
                            
                            Button {
                                withAnimation {
                                    self.showBottomCard.toggle()
                                    self.cardDismissal.toggle()
                                }
                            } label: {
                                Text("Select days")
                                    .font(.openSans(size: 14))
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
                }.padding(.horizontal)
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
            
            GeometryReader { proxy in
                BottomCard(isPresented: $showBottomCard, height: proxy.size.height / 2) {
                    WeekDaysSelectorView(onSubmit: { days in
                        withAnimation {
                            self.showBottomCard = false
                        }
                    }, onDismiss: {
                        withAnimation {
                            self.showBottomCard = false
                        }
                    })
                }
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

fileprivate struct WeekDaysSelectorView: View {
    @State private var selectedDays : [WeekDay : Bool] = [:]
    @State private var allSelected : Bool = false
    let onSubmit : (_ weekDays :[String]) -> ()
    let onDismiss : () -> ()
    var body: some View {
        VStack {
            let weekdays = WeekDay.allCases
            
            HStack{
                Text("EveryDay")
                    .font(.openSans(size: 14))
                Image(systemName: allSelected ? "checkmark.square.fill" : "square")
                    .foregroundColor(ColorConstant.primary)
                Spacer()
            }
            .contentShape(Rectangle())
            .padding()
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.15))  {
                    allSelected.toggle()
                    for day in weekdays {
                        selectedDays[day] = allSelected
                    }
                }
            }
            List(weekdays, id: \.self) { day in
                HStack{
                    Text(day.rawValue)
                        .font(.openSans(size: 14))
                    Spacer()
                    Image(systemName: (selectedDays[day] ?? false) ? "checkmark.square.fill" : "square")
                        .foregroundColor(ColorConstant.primary)
                }.contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.15)) {
                        selectedDays[day] = !(selectedDays[day] ?? false)
                        allSelected = selectedDays.values.filter{$0}.count == 7
                    }
                }
            }.listStyle(.inset)
            HStack {
                Button {
                    let days = selectedDays.keys.filter{selectedDays[$0] ?? false}
                    onSubmit(days.map{$0.rawValue})
                } label: {
                    Text("Confirm")
                        .font(.openSans(size: 14, weight: .semiBold))
                        .foregroundColor(.white)
                        .contentShape(Rectangle())
                }
                .frame(width: 120, height: 35)
                .background(ColorConstant.primary)
                .cornerRadius(20)
                .shadow(radius: 3)
                .padding()
                
                Button {
                    onDismiss()
                } label: {
                    Text("Cancel")
                        .font(.openSans(size: 14, weight: .semiBold))
                        .foregroundColor(.black)
                        .contentShape(Rectangle())
                }
                .frame(width: 120, height: 35)
                .background(ColorConstant.system)
                .cornerRadius(20)
                .shadow(radius: 3)
                .padding()
            }
            
        }.padding(.top, 10)
    }
}
