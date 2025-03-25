//
//  AddCountryView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 25/03/25.
//

import SwiftUI

struct AddCountryView: View {
    @Bindable private var viewModel : LoginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel : LoginViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing:20){
                Text("What's your country or region?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("This help us find you more relelated content. We won't show it to your profile")
                    .font(.title3)
                    .padding(.bottom)
                TextField("Country", text: $viewModel.country)
                    .emailmodifier()
                    .disabled(true)
                    .overlay(alignment : .trailing){
                        Image(systemName: "chevron.right")
                            .padding(.trailing)
                            .foregroundStyle(.gray)
                    }
                   
                    .onTapGesture {
                        viewModel.showCountriesList = true
                    }
                
          

                Spacer()
                NavigationLink {
                    //AddAgeView(viewModel: viewModel).navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width * 0.9, height: 60)
                        .background(viewModel.fullName.count < 3 ? Color(.systemGray5) :.red)
                        .foregroundStyle(viewModel.fullName.count < 3 ? .black : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    
                }
                
            }
            .padding()
            .fullScreenCover(isPresented: $viewModel.showCountriesList) {
                Text("Countries list")
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            viewModel.gender = ""
                            dismiss()
                        }
                }
                ToolbarItem(placement: .principal) {
                    IndicatorView(numberOfScreens: 5)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        AddCountryView(viewModel: LoginViewModel())
    }
}
