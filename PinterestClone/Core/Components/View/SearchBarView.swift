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
    var showImageIcon : Bool = true
    var aligments : Alignment = .trailing
    var body: some View {
        ZStack(alignment : aligments){
            TextField(title,text: $text)
                .padding(.leading, aligments == .leading ? 30 : 0)
            if aligments == .trailing {
                Image(systemName: text.isEmpty ? "camera.fill" :"xmark.circle.fill")
                    .padding(.trailing,5)
                    .foregroundStyle(.gray)
                    .opacity(showImageIcon ? 1 : 0)
                    .onTapGesture {
                        text = ""
                    }
            }else {
                Image(systemName: text.isEmpty ? "magnifyingglass" :"xmark.circle.fill")
                    .padding(.trailing,5)
                    .foregroundStyle(.gray)
                    .opacity(showImageIcon ? 1 : 0)
                    .onTapGesture {
                        text = ""
                    }
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
