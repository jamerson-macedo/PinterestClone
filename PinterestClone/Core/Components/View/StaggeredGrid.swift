//
//  StaggeredGrid.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 12/03/25.
//

import SwiftUI

struct StaggeredGrid<Content: View,T: Identifiable>: View  where T:Hashable{
    private var items : [T]
    private var columns : Int
    private var content : (T) -> Content
    init(items: [T], columns: Int, @ViewBuilder content: @escaping (T) -> Content) {
        self.items = items
        self.columns = columns
        self.content = content
    }
    // deixando os itens em zigzag
    func setupList() -> [[T]]{
        var gridArray : [[T]] = Array(repeating: [], count: columns)
        var currentIndex : Int = 0
        for item in items{
            gridArray[currentIndex].append(item)
            if currentIndex == columns - 1{
                currentIndex = 0
            }else {
                currentIndex += 1
            }
        }
        return gridArray
    }
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top,spacing: 10){
                ForEach(setupList(),id: \.self) { columnData in
                    LazyVStack(spacing : 10){
                        ForEach(columnData) { item in
                            //ItemCard(item: item)
                            content(item)
                        }
                    }
                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    var items : [Item] = [
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "egito1"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "egito2"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "dp"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "easy"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "purple"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "selfie")
        
    ]
    StaggeredGrid(items: items, columns: 2) { item in
        ItemCard(item: item)
    }
}

struct ItemCard: View {
    private var item: Item
    
    init(item: Item) {
        self.item = item
    }
    var body: some View {
        VStack(alignment : .trailing){
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Image(systemName: "ellipsis")
                .imageScale(.large)
                .padding(.vertical)
        }
    }
}
