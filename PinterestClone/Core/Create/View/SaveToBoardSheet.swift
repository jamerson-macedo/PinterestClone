//
//  SaveToBoardSheet.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 05/04/25.
//

import SwiftUI

struct SaveToBoardSheet: View {
    @Bindable private var viewModel : CreateViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel : CreateViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    
    var body: some View {
        VStack(spacing:0){
            Text("Save to board")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .overlay(alignment : .leading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                    
                }.padding(.vertical)
            ScrollView {
                Button {
                    viewModel.selectedBoard = "Nature"
                    dismiss()
                } label: {
                    HStack(spacing : 12) {
                        Image("cr7")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50,height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("Nature")
                            .font(.headline)
                            .foregroundStyle(.black)
                        Spacer()
                    }
                }

            }
            Button {
                
            } label: {
                HStack(spacing: 12){
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 50,height: 50)
                        .overlay {
                            Image(systemName: "plus")
                                .imageScale(.large)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.darkGray))
                        }
                    Text("Create board")
                        .font(.headline)
                        .foregroundStyle(.black)
                    Spacer()
                }
            }

            
        }.padding()
    }
}

#Preview {
    SaveToBoardSheet(viewModel: CreateViewModel())
}
