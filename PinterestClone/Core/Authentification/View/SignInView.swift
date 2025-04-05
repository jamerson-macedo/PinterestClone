//
//  SignInView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 20/03/25.
//

import SwiftUI

struct SignInView: View {
    @Bindable private var viewModel : LoginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel: LoginViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                }
                Spacer()
                Text("Log in").font(.headline)
                Spacer()
                
            }
            Divider().padding(.vertical)
            LoginButton(title: "Continue with Facebook",imageName:"facebook", color: .blue){
                
            }
            LoginButton(title: "Continue with Google", imageName: "google", color: Color(.systemGray5), foregroundColor: .black) {
            }
            Text("or")
                .padding(.vertical)
            TextField("Email", text: $viewModel.email).emailmodifier()
                .padding(.bottom)
            
            CustomSecureField(isSecureField: $viewModel.isSecureField, password: $viewModel.password)
            LoginButton(title: "Log In") {
                Task{
                    try await viewModel.login()
                }
            }
            .padding(.top,30)
            Text("Forgotten password?")
                .padding(.top)
            Spacer()
            
        } .padding()
    }
}

#Preview {
    SignInView(viewModel: LoginViewModel())
}


