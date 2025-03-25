//
//  AddAgeView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 25/03/25.
//

import SwiftUI

struct AddAgeView: View {
    @Bindable private var viewModel : LoginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel : LoginViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack(spacing:20){
                    Text("Hi \(viewModel.fullName)! Enter your date of birth")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("To help jeel Pinterest safe, we now require your date of birth. Your date of birth also help us provide more personalised recomemendations and relevent ads. We won't share this information without your permission and it won't be visible on your profile")
                        .frame(width: proxy.size.width * 0.9)
                    Button {
                        viewModel.isPresented = true
                    } label: {
                        Text("\(viewModel.selectedDate.formatted(date:.long, time: .omitted))").foregroundStyle(.black)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                            
                    }
                    Text("Use your own age, even if this is a business")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                    
                    Spacer()
                    NavigationLink {
                        AddGenderView(viewModel: viewModel).navigationBarBackButtonHidden()
                    } label: {
                        Text("Next")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(width: proxy.size.width * 0.9, height: 60)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        
                        
                    }
                    
                    
                }
                .padding()
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .onTapGesture {
                                viewModel.birthDate = ""
                                dismiss()
                            }
                    }
                    ToolbarItem(placement: .principal) {
                        IndicatorView(numberOfScreens: 3)
                    }
                }
                DatePickerPopup(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddAgeView(viewModel: LoginViewModel())
    }

}

struct DatePickerPopup: View {
    @Bindable private var viewModel : LoginViewModel
    init(viewModel: LoginViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        ZStack{
            if viewModel.isPresented{
                Color.black.opacity(0.4).ignoresSafeArea()
                    .onTapGesture {
                        viewModel.isPresented = false
                    }
            }
            VStack{
                HStack(spacing: 20){
                    Picker("Day", selection: $viewModel.tempDate){
                        ForEach(1..<32,id: \.self){ day in
                            Text(String(format: "%02d", day))
                                .tag(viewModel.dayComponents(day: day))
                            
                        }
                    }.pickerStyle(.wheel)
                        .frame(width:60)
                        .clipped()
                    Picker("Month", selection: $viewModel.tempDate){
                        ForEach(0..<12,id: \.self){ month in
                            Text(viewModel.months[month])
                                .tag(viewModel.dayComponents(month: month + 1))
                            
                        }
                    }.pickerStyle(.wheel)
                        .frame(width:80)
                        .clipped()
                    
                    Picker("Year", selection: $viewModel.tempDate){
                        ForEach(viewModel.avalialbleYears,id: \.self){ year in
                            Text(String(year))
                                .tag(viewModel.dayComponents(year: year))
                            
                        }
                    }.pickerStyle(.wheel)
                        .frame(width:80)
                        .clipped()
                }
                HStack(spacing:30){
                    Spacer()
                    Button {
                        viewModel.isPresented = false
                    } label: {
                        Text("Cancel")
                    }
                    Button {
                        viewModel.selectedDate = viewModel.tempDate
                        viewModel.isPresented = false
                    } label: {
                        Text("Ok")
                    }
                    
                }
                
                .foregroundStyle(.black)
                .padding(30)
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal,20)
            .opacity(viewModel.isPresented ? 1 : 0)
            .scaleEffect(viewModel.isPresented ? 1 : 0.5)
            .animation(.spring,value: viewModel.isPresented)
            
        }
    }
}
