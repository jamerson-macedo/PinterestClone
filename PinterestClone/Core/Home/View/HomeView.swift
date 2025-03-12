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
                StaggeredGrid(items: viewModel.items, columns: 2)
            }
        }
    }
}

#Preview {
    HomeView()
}
