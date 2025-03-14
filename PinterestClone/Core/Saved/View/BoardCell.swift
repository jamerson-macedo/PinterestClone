//
//  BoardCell.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 13/03/25.
//

import SwiftUI

struct BoardCell: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing:2){
                Color.gray.opacity(0.2).frame(width: 100,height: 162)
                    .clipShape(CustomCorner(corners: [.topLeft,.bottomLeft], radius: 16))
                VStack(spacing:2){
                    Color.gray.opacity(0.2).frame(height: 80)
                        .clipShape(CustomCorner(corners: .topRight, radius: 16))
                    Color.gray.opacity(0.2).frame(height: 80)
                        .clipShape(CustomCorner(corners: .bottomRight, radius: 16))
                }.frame(width: 80)
            }
            Text("Test")
                .font(.headline)
            HStack{
                Text("3 Pin")
                    .font(.footnote)
                Text("5d")
                    .font(.caption)
                
            }
            .foregroundStyle(.gray)
            
        }
    }
}

#Preview {
    BoardCell()
}
