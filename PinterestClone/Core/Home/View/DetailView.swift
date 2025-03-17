//
//  DetailView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 13/03/25.
//

import SwiftUI

struct DetailView: View {
    @Bindable private var viewModel : HomeViewModel
    private var index : Int
    @Environment(\.dismiss) private var dismiss
    init(viewModel: HomeViewModel, index:Int) {
        self._viewModel = Bindable(viewModel)
        self.index = index
    }
    var body: some View {
        ScrollView {
            VStack(alignment : .leading, spacing: 25){
                ZStack(alignment : .topLeading){
                    ZStack(alignment: .bottomTrailing) {
                        Image(viewModel.items[index].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        VStack{
                            DetailCircleView(imageName: "magnifyingglass",dimension: 40)
                            DetailCircleView(imageName: "scissors",dimension: 40)
                        }.padding()
                    }
                    Button {
                        dismiss()
                    } label: {
                        DetailCircleView(imageName: "chevron.backward", dimension: 50).padding()
                    }

                }
                HStack(spacing:25){
                    Image(systemName: "heart")
                    Image(systemName: "bubble")
                    Image(systemName: "square.and.arrow.up")
                    Image(systemName: "ellipsis")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Save")
                            .padding(.horizontal)
                            .padding(.vertical,5)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 23))
                            
                    }

                   
                    
                    
                }
                HStack{
                    Image("car").resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(.circle)
                    Text("Jamerson Macedo").font(.headline)
                    
                }
                Text("1 comment")
                    .font(.subheadline)
                HStack{
                    Image("car")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .clipShape(.circle)
                    Text("Yes, should be...")
                        .font(.subheadline)
                    Button {
                        
                    } label: {
                        Text("View").font(.subheadline)
                    }

                        
                }
                Button {
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30).stroke(Color(.systemGray2),lineWidth: 1)
                        HStack{
                            Text("Add a comment").foregroundStyle(Color(.systemGray2))
                            Spacer()
                        }.padding(10)
                    }
                    
                }
                Divider()
                Text("More to explore")
                    .font(.headline)
                    .foregroundStyle(Color(.darkGray))
                StaggeredGrid(items: viewModel.items, columns: 2){ item in
                    ItemCard(item: item)
                    
                }

            }.padding(.horizontal)
                .padding(.top)
        }
       
    }
}

#Preview {
    DetailView(viewModel: HomeViewModel(), index: 0)
}

struct DetailCircleView: View {
    var imageName : String
    var dimension : CGFloat
    var body: some View {
        Circle().fill(Color(.systemGray5)).frame(width: dimension,height: dimension)
            .overlay {
                Image(systemName: imageName)
                    .imageScale(dimension > 40 ? .large : .medium)
                    .fontWeight(dimension > 40 ? .bold : .regular)
                    .foregroundStyle(Color(.darkGray))
            }
    }
}
