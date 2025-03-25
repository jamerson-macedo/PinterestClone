//
//  AddPasswordvIEW.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 25/03/25.
//

import SwiftUI

struct AddPasswordView: View {
    @Bindable private var viewModel : LoginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel : LoginViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing:20){
                Text("Create a password")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                CustomSecureField(isSecureField: $viewModel.isSecureField, password: $viewModel.password).padding()
                Spacer()
                NavigationLink {
                    AddNameView(viewModel: viewModel).navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width * 0.9, height: 60)
                        .background(viewModel.password.count < 6 ? Color(.systemGray5) :.red)
                        .foregroundStyle(viewModel.password.count < 6 ? .black : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    
                }
                
                
            }.toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            viewModel.password = ""
                            dismiss()
                        }
                }
                ToolbarItem(placement: .principal) {
                    IndicatorView(numberOfScreens: 1)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddPasswordView(viewModel: LoginViewModel())
    }
  
}


