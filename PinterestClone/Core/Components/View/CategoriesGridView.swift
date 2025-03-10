//
//  CategoriesGridView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 10/03/25.
//

import SwiftUI

struct CategoriesGridView: View {
    
    @Bindable var viewModel : SearchViewModel
    private let gridItem : [GridItem] = [.init(.flexible(),spacing: 1), .init(.flexible(),spacing: 1)]
    private var imageDimensions : CGFloat {
        UIScreen.main.bounds.width / 2 - 16
    }
    
    var body: some View {
        LazyVGrid(columns: gridItem, spacing: 1) {
            ForEach(viewModel.filtredItems) { item in
                CategoryItemView(item: item, width: imageDimensions)
        
            }
        }
    }
}

#Preview {
    CategoriesGridView(viewModel: SearchViewModel())
}

struct CategoryItemView: View {
    private var item : Item
    private var width : CGFloat
    init(item: Item, width: CGFloat) {
        self.item = item
        self.width = width
    }
    var body: some View {
        ZStack{
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: 120)
                .clipped()
                .overlay {
                    Color.black.opacity(0.3)
                }
            Text(item.item_name)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.vertical,8)
    }
}
