//
//  UpdatesView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import SwiftUI

struct UpdatesView: View {
    var body: some View {
        
        ContentUnavailableView {
            VStack(spacing : 20){
                Spacer()
                Image("notification").resizable()
                    .frame(width: 150, height: 150)
                Text("Nothing to see here yet")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("Try exploring your home feed, creating a board or following someone with ideas that inspire you")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Spacer()
            }.padding(.horizontal,20)
        }
    }
}

#Preview {
    UpdatesView()
}
