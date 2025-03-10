//
//  SearchView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 10/03/25.
//

import SwiftUI

struct SearchView: View {
    @State private var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack{
            VStack{
                SearchBarView(text: $viewModel.searchTerm, title: viewModel.title)
                Text("Popular in Pinterest")
                    .font(.title2)
                    .fontWeight(.semibold)
                CategoriesGridView(viewModel: viewModel)
                Spacer()
            }
            .padding(.vertical,20)
        }
    }
}

#Preview {
    SearchView()
}
