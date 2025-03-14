//
//  BoardView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 13/03/25.
//

import SwiftUI

struct BoardView: View {
    @Bindable private var viewModel : SavedViewModel
    init(viewModel: SavedViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    
    var body: some View {
        VStack(spacing: 20){
            HStack(spacing:0){
                BoarderOptionView(text: nil)
                BoarderOptionView(text: "Group")
                BoarderOptionView(text: "Secret")
                Spacer()
            }
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 16) {
                    ForEach(0 ..< 3) { index in
                        BoardCell()
                    }
                }
            }
            .scrollIndicators(.hidden)
            Spacer()
        }
    }
}

#Preview {
    BoardView(viewModel: SavedViewModel())
}

struct BoarderOptionView: View {
    var text : String?
    init(text: String?) {
        self.text = text
    }
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .frame(width: 55,height:30)
                .overlay {
                    if let text = text {
                        Text(text).font(.footnote)
                    }else{
                        HStack(spacing : 0){
                            Image(systemName: "arrow.up.arrow.down").imageScale(.small)
                            Image(systemName: "chevron.down").imageScale(.small)
                        }.fontWeight(.bold)
                    }
                }
        }.padding(.leading)
    }
}
