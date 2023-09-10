//
//  SettingsView.swift
//  Hike
//
//  Created by Zeki Baklan on 2.09.2023.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPORTIES
    
    private let alternateAppIcons : [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire",]
    
    
    
    
    
    
    var body: some View {
        
        List {
            
            // MARK: - SECTION: HEADER
            
            
            Section {
                
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                        
                        
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80,weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which look gorgeous in photos but is even better you are actually there . The hike that you hope to do again someday.\nFind the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            // MARK: - SECTION: ICONS
            Section(header: Text("Alternate Icons")) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        
                                        print("Failed request to update the app's icon : \(String(describing: error?.localizedDescription))")
                                    }
                                    else {
                                        print("Success!")
                                    }
                                    
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                        }.buttonStyle(.borderless)
                        }
                    }
                    
                    
                }//: SCROLL VIEW
                .padding(.top,12)
                
                Text("Choise your favourite app icon from the collection above.")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            }//: SECTION
            .listRowSeparator(.hidden)
            
            
            
            // MARK: - SECTION: ABOUT
            
            Section(header: Text("ABOUT THE APP"), footer: HStack{
                
                Spacer()
                Text("Copyright © All right reserved.")
                Spacer()
                
            }.padding(.vertical,8)
            ) {
                
                //: 1.Basic Labeled Content
         
                
                //: 2.Advanced label content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE" , rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Techonology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Zeki Baklan", rowTintColor: .mint)
               
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "zekibaklan.com", rowLinkDestination: "https://zekibaklan.github.io")
            }//: SECTION
            
        }//: List
    
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        
    }
}