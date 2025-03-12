//
//  PinCard.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import SwiftUI

struct PinCard: View {
    private var index : Int
    @Bindable private var viewModel : CreateViewModel
    init(index: Int, viewModel: CreateViewModel) {
        self.index = index
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        VStack{
            Button {
                viewModel.pins[index].isSelected.toggle()
            } label: {
                ZStack(alignment:.bottomTrailing){
                    Image(viewModel.pins[index].imageName)
                        .resizable()
                        
                        .frame(height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Image(systemName:viewModel.pins[index].isSelected ? "checkmark" : "pin.fill")
                        .foregroundStyle(.white)
                        .padding(8)
                        .background(viewModel.pins[index].isSelected ? .black : .black.opacity(0.5))
                        .clipShape(Circle())
                        .padding(8)
                    
                }
            }
            Text(viewModel.pins[index].item_name)
                .foregroundStyle(.black)
                .font(.subheadline)
                .padding(.horizontal)
                .lineLimit(2,reservesSpace: true)

           
        }
    }
}

#Preview {
    PinCard(index: 1, viewModel: CreateViewModel())
}
