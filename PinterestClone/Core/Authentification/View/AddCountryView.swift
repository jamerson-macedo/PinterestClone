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
                ZStack{
                    TextField("Country", text: $viewModel.country)
                        .emailmodifier()
                        .disabled(true)
                        .overlay(alignment : .trailing){
                            Image(systemName: "chevron.right")
                                .padding(.trailing)
                                .foregroundStyle(.gray)
                        }
                    Button {
                      
                            viewModel.showCountriesList = true
                       
                    } label: {
                        Rectangle().fill(.clear)
                            .frame(width: proxy.size.width * 0.9, height: 44)
                    }

                    
                }

                Spacer()
                NavigationLink {
                    InterestView(viewModel: viewModel).navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width * 0.9, height: 60)
                        .background(.red)
                        .foregroundStyle( .white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    
                }
                
            }
            .padding()
            .fullScreenCover(isPresented: $viewModel.showCountriesList) {
                ListCountriesView(viewModel: viewModel)
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
