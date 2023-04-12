//
//  SettingsTab.swift
//  Pawsitively
//
//  Created by Mohammed Al-Quraini on 4/12/23.
//

import SwiftUI

struct SettingsTab: View {
    @State private var navPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navPath) {
                List {
                    Section {
                        Button {
                            navPath.append(SettingDestinationPage.profile)
                        } label: {
                            
                            HStack(spacing: 15) {
                                Image(systemName: "person")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.gray)
                                    .padding()
                                    .background(.gray.opacity(0.25))
                                    .clipShape(Circle())
                                    .frame(width: 75, height: 75)
                                
                                VStack(spacing: 10) {
                                    Text("John Whick")
                                        .font(.openSans(size: 18, weight: .semiBold))
                                    
                                    Text("john@gmail.com")
                                        .font(.openSans(size: 13, weight: .light))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .padding(.vertical)
                            .foregroundColor(.black)
                        }
                    }
                    
                    Section {
                        SettingListItem(title: "My pets", icon: "setting-dog") {
                            navPath.append(SettingDestinationPage.myPets)
                        }
                    }
                    
                    Section {
                        SettingListItem(title: "Notifications", icon: "setting-bell") {}
                    }
                    
                    Section("Contact") {
                        SettingListItem(title: "Report a bug", icon: "setting-bug") {}
                        SettingListItem(title: "Follow us on twitter", icon: "setting-twitter"){}
                        SettingListItem(title: "Share app", icon: "setting-share") {}
                    }
                    
                    Section {
                        SettingListItem(title: "Logout", icon: "setting-logout", color: .red, showChevron: false) {}
                    }
                }
                .navigationDestination(for: SettingDestinationPage.self) { page in
                    switch page {
                    case .myPets: MyPetsPage()
                    case .profile: SettingProfilePage()
                    case .notifications : EmptyView()
                    }
                }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsTab_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTab()
    }
}

fileprivate struct SettingListItem : View {
    let title : String
    let icon: String
    var color : Color = .black
    var showChevron : Bool = true
    let onTap : () -> ()
    
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack(spacing: 20) {
                Image(icon)
                Text(title)
                    .foregroundColor(color)
                    .font(.openSans(size: 13))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
                    .isHidden(!showChevron)
            }
        }
    }
}

fileprivate enum SettingDestinationPage : Hashable {
    case profile, myPets, notifications
}
