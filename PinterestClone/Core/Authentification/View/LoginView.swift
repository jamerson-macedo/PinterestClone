//
//  LoginView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Spacer()
                Image("pinterest").resizable().frame(width: 200, height: 200).padding(.top)
                VStack(spacing:18){
                    Text("Welcome to Pinterest")
                        .font(.title)
                        .fontWeight(.bold)
                    TextField("Email address",text: $viewModel.email)
                        .padding(12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray3),lineWidth: 1)
                        }
                    LoginButton(title: "Continue") {
                    }.padding(.bottom)

                    LoginButton(title: "Continue with Facebook", imageName: "facebook", color: .blue) {
                    }

                    LoginButton(title: "Continue with Google", imageName: "google", color: Color(.systemGray5), foregroundColor: .black) {
                    }
                    Spacer()
                    Text("By continuing, you agree to Pinterest's")
                        .font(.footnote) +
                    Text(" Terms of Service and Privacy Policy.")
                        .font(.footnote)
                        .foregroundStyle(.blue) +
                    Text(" and acnowledge that you have read the ")
                        .font(.footnote) +
                    Text("Notice at collection")
                        .font(.footnote)
                        .foregroundStyle(.blue)
                }
                
            }.padding()
        }
    }
}

#Preview {
    LoginView()
}

struct LoginButton: View {
    private var title: String
    private var imageName: String?
    private var color: Color
    private var foregroundColor: Color
    private var action: () -> Void
    
    init(title: String,
         imageName: String? = nil,
         color: Color = .red,
         foregroundColor: Color = .white,
         action: @escaping () -> Void) {
        self.title = title
        self.imageName = imageName
        self.color = color
        self.foregroundColor = foregroundColor
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading)
                }
              
                Text(title)
                    .foregroundStyle(foregroundColor)
                    .font(.headline)
             
            }
            .frame(width: 350, height: 44)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
}
