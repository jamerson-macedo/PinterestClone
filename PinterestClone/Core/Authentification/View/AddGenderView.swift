//
//  AddGenderView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 25/03/25.
//

import SwiftUI

struct AddGenderView: View {
    @Bindable private var viewModel : LoginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel : LoginViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing:20){
                Text("What's your Gender?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("This help us find you more relelated content. We won't show it to your profile")
                    .font(.title3)
                    .padding(.bottom)
                
                Button {
                    viewModel.gender = "Female"
                    viewModel.isNavigationActive = true
                } label: {
                    GenderView(name: "Female", gender: $viewModel.gender, cgSize: proxy.size.width)
                        
                }
                Button {
                    viewModel.gender = "Male"
                    viewModel.isNavigationActive = true
                } label: {
                    GenderView(name: "Male", gender: $viewModel.gender, cgSize: proxy.size.width)
                        
                }
                Button {
                    viewModel.gender = "Specify another gender"
                    viewModel.isNavigationActive = true
                } label: {
                    GenderView(name: "Specify another gender", gender: $viewModel.gender, cgSize: proxy.size.width)
                        
                }

                Spacer()
                
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.isNavigationActive, destination: {
                Text("Country")
            })
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
                    IndicatorView(numberOfScreens: 4)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        AddGenderView(viewModel: LoginViewModel())
    }
 
}

struct GenderView: View {
    var name : String
    @Binding var gender : String
    var cgSize : CGFloat
    var body: some View {
        Text(name)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(gender == name ? .white : .black)
            .frame(width: cgSize * 0.9, height: 60)
            .background( gender == name ? .red : Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
