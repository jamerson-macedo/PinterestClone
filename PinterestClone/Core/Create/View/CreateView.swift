//
//  CreateView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import SwiftUI

struct CreateView: View {
    @State var viewModel = CreateViewModel()
    @Binding var isFullScreen: Bool
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        if viewModel.showCreateBoard{
            CreateBoardVIew(viewModel: viewModel)
        }else if viewModel.showFullScreenGallery{
            FullScreenPhotoGalleryView(viewModel: viewModel)
        }else {
            NavigationStack {
                VStack(spacing:25){
                    Text("Start creating now")
                        .font(.title3)
                        .fontWeight(.semibold)
                    HStack(spacing : 50){
                        Button {
                            viewModel.showFullScreenGallery = true
                            isFullScreen = true
                        } label: {
                            CreateOptionView(titleIcons: "Pin", icon: "pin.fill")
                        }

                       
                        CreateOptionView(titleIcons: "Colege", icon: "scissors")
                        Button {
                            viewModel.showCreateBoard = true
                            isFullScreen = true
                        } label: {
                            CreateOptionView(titleIcons: "Board", icon: "square.grid.2x2.fill")
                        }
                        
                        
                    }
                    Spacer()
                }.toolbar {
                    ToolbarItem(placement:.topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.black)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    CreateView(isFullScreen: .constant(false))
}

struct CreateOptionView: View {
    private var titleIcons : String
    private var icon : String
    init(titleIcons: String, icon: String) {
        self.titleIcons = titleIcons
        self.icon = icon
    }
    var body: some View {
        VStack(spacing: 8){
            Circle()
                .fill(Color(.systemGray6))
                .frame(width: 60, height: 60)
                .overlay {
                    Image(systemName: icon)
                        .font(.system(size: 24))
                }
            Text(titleIcons).font(.caption)
        }.foregroundStyle(.black)
    }
}
