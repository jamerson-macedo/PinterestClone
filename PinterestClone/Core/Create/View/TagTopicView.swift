//
//  TagTopicView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 03/04/25.
//

import SwiftUI

struct TagTopicView: View {
    @Bindable private var viewModel : CreateViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel : CreateViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment : .leading,spacing : 16){
                
                TextField("Search Topics", text: $viewModel.searhText)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                if viewModel.selectedTopics.count > 0 {
                    Text("Selected")
                        .font(.headline)
                        .foregroundStyle(.green)
                }
                ScrollView {
                    LazyVGrid(columns: viewModel.topicGridItems,spacing: 8) {
                        ForEach(viewModel.displayTopics, id:\.self){ topic in
                            TagButton(topic: topic, isSelected: viewModel.selectedTopics.contains(topic), action: {
                                viewModel.toggleSelection(topic)
                            })

                           
                            
                        }
                    }
                }.scrollIndicators(.hidden)
             
                    
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement : .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }

                  
                }
                ToolbarItem(placement : .principal) {
                    Text("Tag topics")
                        .fontWeight(.bold)
                    
                }
                ToolbarItem(placement : .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.headline)
                            .padding(8)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.white)
                    }

                    
                }
            }
        }
    }
}

#Preview {
    TagTopicView(viewModel: CreateViewModel())
}

struct TagButton: View {
    let topic : String
    let isSelected : Bool
    let action : () -> Void
    var body: some View {
        Button(action: action) {
            Text(topic)
                .lineLimit(1)
                .truncationMode(.middle)
                .foregroundStyle(isSelected ? .white : Color(.darkGray))
                .padding(8)
                .background(isSelected ? .black : Color(.systemGray4))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .frame(maxWidth : .infinity, minHeight: 44, alignment : .leading)
        }
    }
}
