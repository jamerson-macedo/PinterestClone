//
//  CreatePinView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 03/04/25.
//

import SwiftUI

struct CreatePinView: View {
    @Bindable private var viewModel : CreateViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel : CreateViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack() {
                    Image("egito1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(alignment:.topTrailing) {
                            Circle()
                                .fill(.black)
                                .frame(width: 30,height: 30)
                                .padding(5)
                                .overlay {
                                    Image(systemName: "pencil")
                                        .imageScale(.large)
                                        .foregroundStyle(.white)
                                }
                            
                        }
                        .padding()
                    PinItemView(text: $viewModel.title, title: "Title", description: "Tell everyone what yoir Pin is about", color: Color(.darkGray))
                    PinItemView(text: $viewModel.description, title: "Decription", description: "Add a description, mention or hastags to your Pin", color: .gray)
                    PinItemView(text: $viewModel.link, title: "Link", description: "Add yor link here", color: .gray)
                    
                    HorizontalPinItemView(selectedBoard: viewModel.selectedBoard, title: "Pick a board").padding(.vertical)
                    HorizontalPinItemView(selectedBoard: viewModel.tags, title: "Tag topics").padding(.vertical)
                    HStack{
                        Circle().fill(Color(.systemGray5))
                            .frame(width: 45,height: 45)
                            .overlay {
                                Image(systemName: "folder.fill")
                            }
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Create")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(10)
                                .background(.red)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }

                    }.padding()
                    
                }
                
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Create Pin")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }

                }
            }
        }
    }
}

#Preview {
    CreatePinView(viewModel: CreateViewModel())
}

struct PinItemView: View {
    @Binding var text  : String
    var title : String
    var description : String
    var color : Color
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(Color(.darkGray))
                TextField(text: $text) {
                    Text(description)
                        .font(.headline)
                        .fontWeight(color == .gray ? .regular : .semibold)
                        .foregroundStyle(color)
                }
                
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

struct HorizontalPinItemView: View {
    var selectedBoard : String
    var title : String
    var body: some View {
        VStack(spacing : 20){
            HStack{
                Text(title)
                    .font(.subheadline)
                Spacer()
                Text(selectedBoard)
                Image(systemName: "chevron.right")
                    .imageScale(.large)
                    .foregroundStyle(.black)
                    .bold()
                
            }
            .foregroundStyle(Color(.darkGray))
            .padding(.horizontal)
            Divider()
        }
       
    }
}
