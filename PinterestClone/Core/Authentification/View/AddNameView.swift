//
//  AddNameView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 25/03/25.
//

import SwiftUI

struct AddNameView: View {
    @Bindable private var viewModel : LoginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel : LoginViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing:20){
                Text("What's your name?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                HStack{
                    Spacer()
                    TextField("Full name", text: $viewModel.fullName)
                        .emailmodifier()
                        .frame(width: proxy.size.width * 0.9)
                    Spacer()
                }
                Spacer()
                NavigationLink {
                    AddAgeView(viewModel: viewModel).navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width * 0.9, height: 60)
                        .background(viewModel.fullName.count < 3 ? Color(.systemGray5) :.red)
                        .foregroundStyle(viewModel.fullName.count < 3 ? .black : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    
                }
                
                
            }.toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            viewModel.fullName = ""
                            dismiss()
                        }
                }
                ToolbarItem(placement: .principal) {
                    IndicatorView(numberOfScreens: 2)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        AddNameView(viewModel: LoginViewModel())
    }
}
