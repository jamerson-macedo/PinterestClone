//
//  SearchBarView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 10/03/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var title : String
    var body: some View {
        ZStack(alignment : .trailing){
            TextField(title,text: $text)
            Image(systemName: text.isEmpty ? "camera.fill" :"xmark.circle.fill")
                .padding(.trailing,5)
                .foregroundStyle(.gray)
                .onTapGesture {
                    text = ""
                }
               
        }
        .font(.headline)
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 25).fill(Color(.systemGray6)))
        .padding()
    }
}

#Preview {
    SearchBarView(text: .constant(""), title: "Search here !")
}
