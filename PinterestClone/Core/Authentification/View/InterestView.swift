//
//  InterestView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 27/03/25.
//

import SwiftUI

struct InterestView: View {
    @Bindable private var viewModel : LoginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel : LoginViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment : .bottom) {
                ScrollView{
                    VStack(spacing:20){
                        Text("What are your interested in?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.top)
                        Text("Pick up 5 to customize your home feed")
                            .font(.title3)
                            .padding(.bottom)
                        LazyVGrid(columns: viewModel.gridItems,spacing: 1) {
                            ForEach(viewModel.interest){ interest in
                                VStack{
                                    ZStack(alignment : .topTrailing) {
                                        Image(interest.imageName)
                                            .resizable()
                                            .frame(width: proxy.size.width / 4, height: proxy.size.width / 4)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                        RoundedRectangle(cornerRadius : 5)
                                            .frame(width: 25, height: 25)
                                            .overlay {
                                                Image(systemName: "checkmark")
                                                    .foregroundStyle(.white)
                                            }
                                            .padding(10)
                                            .opacity(interest.isSelected ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        if let index = viewModel.interest.firstIndex(where: { $0 == interest }){
                                            viewModel.interest[index].isSelected.toggle()
                                            if viewModel.interest[index].isSelected{
                                                viewModel.selectedInterest.append(interest)
                                            }else{
                                                viewModel.selectedInterest.remove(at: index)
                                            }
                                        }
                                    }
                                    Text(interest.itemName)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .padding(.vertical)
                                }
                            }
                        }
                    }
                    
                }
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .onTapGesture {
                                dismiss()
                                viewModel.selectedInterest = []
                            }
                        
                    }
                    ToolbarItem(placement: .principal) {
                        IndicatorView(numberOfScreens: 6)
                    }
                }
                HStack {
                    Spacer()
                    Button {
                        Task{ try await viewModel.createUser() }
                    } label: {
                        Text("Next")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(width: proxy.size.width * 0.9, height: 60)
                            .background(viewModel.selectedInterest.count > 4 ? .red : Color(.systemGray6))
                            .foregroundStyle(viewModel.selectedInterest.count > 4 ? .white : .black)
                        
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }

                    Spacer()
                }
                
            }
        }
    }
}

#Preview {
    NavigationStack{
        InterestView(viewModel: LoginViewModel())
    }
}
