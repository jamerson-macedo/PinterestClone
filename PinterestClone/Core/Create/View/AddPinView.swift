//
//  AddPinView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import SwiftUI

struct AddPinView: View {
    @Bindable var viewModel : CreateViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel: CreateViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel) // quando usa o _ estou chamando a instancia que criou
    }
    private let gridItem : [GridItem] = [.init(.flexible(),spacing: 16), .init(.flexible(),spacing: 16)]
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: gridItem,spacing: 16) {
                    ForEach(0..<viewModel.pins.count, id:\.self){ index in
                        PinCard(index: index, viewModel: viewModel)
                    }
                    
                }
            }
            .padding(.top)
            .padding(.horizontal)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                                .imageScale(.large)
                        }
                        Text("Add pins")
                        
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    }label: {
                        Text("Done")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .padding(.vertical,15)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        
                    }
                }
            }
        }
    }
}

#Preview {
    AddPinView(viewModel: CreateViewModel())
}
