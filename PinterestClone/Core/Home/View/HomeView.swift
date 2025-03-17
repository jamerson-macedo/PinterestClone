//
//  HomeView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 12/03/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    var body: some View {
        VStack{
            VStack(spacing : 0){
                Text("All")
                    .font(.title2)
                    .fontWeight(.semibold)
                Rectangle().frame(width: 32,height: 4)
                
                StaggeredGrid(items: viewModel.items, columns: 2){ item in
                    NavigationLink {
                        DetailView(viewModel: viewModel, index: viewModel.items.firstIndex(where: {
                            $0.id == item.id
                        }) ?? 0).navigationBarBackButtonHidden()
                    } label: {
                        ItemCard(item: item)
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
    }
}
