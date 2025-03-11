//
//  CreateBoardVIew.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import SwiftUI

struct CreateBoardVIew: View {
    @Bindable private var viewModel : CreateViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: CreateViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        VStack(alignment:.leading,spacing: 15){
            ZStack {
                
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Next")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.darkGray))
                            .padding(.horizontal)
                            .padding(.vertical,15)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                }
                Text("Create Board").font(.headline)
            }
            .padding(.vertical,12)
            Text("Board name")
                .font(.footnote)
                .foregroundStyle(Color(.darkGray))
                .padding(.top)
            TextField("Add a title such 'DIY' or 'recipe'", text:$viewModel.boardName)
            Text("Colaborators").titleModifier()
            HStack{
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 50, height: 50)
                Spacer()
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 50, height: 50)
                    .overlay {
                        Image(systemName: "person.fill.badge.plus")
                    }
            }
            Text("Visibility").titleModifier()
            Toggle(isOn: $viewModel.isSecretBoard) {
                Text("Keep this board Srecret")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            Text("If you don`t want others to see this board, keep it secret")
                .titleModifier()
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CreateBoardVIew(viewModel: CreateViewModel())
}
