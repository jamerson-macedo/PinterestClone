//
//  StaggeredGrid.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 12/03/25.
//

import SwiftUI

struct StaggeredGrid: View {
    private var items : [Item]
    private var columns : Int
    init(items: [Item], columns: Int) {
        self.items = items
        self.columns = columns
    }
    // deixando os itens em zigzag
    func setupList() -> [[Item]]{
        var gridArray : [[Item]] = Array(repeating: [], count: 2)
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
                            VStack(alignment : .trailing){
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                                Image(systemName: "ellipsis")
                                    .imageScale(.large)
                                    .padding(.vertical)
                            }
                        }
                    }
                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    StaggeredGrid(items: [
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "egito1"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "egito2"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "dp"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "easy"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "purple"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "selfie")
        
    ], columns: 2)
}
