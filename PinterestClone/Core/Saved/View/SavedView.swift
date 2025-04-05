//
//  SavedView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 13/03/25.
//

import SwiftUI

struct SavedView: View {
    @State private var viewModel = SavedViewModel()
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack{
                    HStack(spacing: 30){
                        NavigationLink {
                            AccountView().navigationBarBackButtonHidden()
                        } label: {
                            Circle()
                                .fill(Color(.systemGray5))
                                .frame(width: 30, height: 30)
                                .overlay {
                                    if let first = viewModel.username.first {
                                        Text(first.uppercased())
                                            .foregroundStyle(Color(.darkGray))
                                    }
                                    
                                }
                        }
                        
                        
                        Spacer()
                        Button {
                            viewModel.selectedTab = .pin
                        } label: {
                            VStack(spacing:4){
                                Text("Pins").font(.subheadline).fontWeight(.semibold).foregroundStyle(Color(.darkGray))
                                Rectangle()
                                    .frame(width: 60,height: 4)
                                    .foregroundStyle(viewModel.selectedTab == .pin ? Color(.darkGray) : .clear)
                            }
                        }
                        
                        Button {
                            viewModel.selectedTab = .board
                        } label: {
                            VStack(spacing:4){
                                Text("Boards").font(.subheadline).fontWeight(.semibold).foregroundStyle(Color(.darkGray))
                                Rectangle()
                                    .frame(width: 60,height: 4)
                                    .foregroundStyle(viewModel.selectedTab == .board ? Color(.darkGray) : .clear)
                            }
                        }
                        Spacer()
                        Circle()
                            .fill(Color(.systemGray5))
                            .frame(width: 30, height: 30)
                            .opacity(0)
                        
                    }
                    .padding(.horizontal)
                    HStack(spacing:0){
                        SearchBarView(text: $viewModel.searchTerm, title: "Search your Pins",aligments: .leading)
                        //Use a largura da tela menos 50, mas nunca menos que zero.
                            .frame(width: max(0, proxy.size.width - 50))
                        Button {
                            //
                        } label: {
                            Image(systemName: "plus").foregroundStyle(.black)
                        }
                        
                    }
                    switch viewModel.selectedTab {
                    case .pin:
                        if viewModel.items.count == 0{
                            EmptyPinView(viewModel: viewModel)
                        }else{
                            StaggeredGrid(items: viewModel.items, columns: 3){ item in
                                ItemCard(item: item)
                                
                            }.padding()
                        }
                    case .board:
                        if viewModel.boardWithPins.count == 0{
                            EmptyBoardView(viewModel: viewModel)
                        }else {
                            BoardView(viewModel: viewModel)
                        }
                      
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SavedView()
}
