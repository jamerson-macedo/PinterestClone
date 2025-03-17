//
//  AccountView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment : .leading,spacing: 20) {
                ProfileView()
                Text("Settings")
                    .font(.subheadline)
                ForEach(SettingOption.allCases){ option in
                    SettingsOption(title:option.title)
                }
                Text("Login")
                    .font(.subheadline)
                ForEach(LoginOption.allCases){ option in
                    if option == .logout{
                        SettingsOption(title: option.title, imageName: "")
                    }else {
                        SettingsOption(title: option.title)
                    }
                }
                Text("Support")
                    .font(.subheadline)
                ForEach(SupportOption.allCases){option in
                    if option == .about{
                        SettingsOption(title: option.title)
                    }else {
                        SettingsOption(title: option.title, imageName: "arrow.up.right")
                    }
                }
                
            }.padding(.horizontal)
        }.toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName:"chevron.left")
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.darkGray))
                }

            }
            ToolbarItem(placement: .principal) {
                Text("Your account")

            }
        }
    }
}

#Preview {
    NavigationStack{
        AccountView()
    }
}

struct ProfileView: View {
    var body: some View {
        HStack{
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 50,height: 50)
                .overlay {
                    Text("J").font(.headline).fontWeight(.semibold)
                }
            VStack(alignment:.leading){
                Text("Jamerson Macedo")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("View profile")
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .fontWeight(.bold)
        }
    }
}

struct SettingsOption: View {
    var title : String
    var imageName : String = "chevron.right"
    var body: some View {
        HStack{
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: imageName)
                .fontWeight(.bold)
            
        }
    }
}
