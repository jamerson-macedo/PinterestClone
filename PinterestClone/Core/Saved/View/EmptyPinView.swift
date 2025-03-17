//
//  EmptyPinView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import SwiftUI

struct EmptyPinView: View {
    @Bindable private var viewModel = SavedViewModel()
    init(viewModel: SavedViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        VStack {
            EmptySavedView(title: "You haven't seen any pins...Yet", subtitle: "Save your favorite ideas as you can easily come back to them later.", buttonTitle: "Explore Pins", imageName: "ideia")
        }
    }
}

#Preview {
    EmptyPinView(viewModel: SavedViewModel())
}

struct EmptySavedView: View {
    private var title : String
    private var subtitle : String
    private var buttonTitle : String
    private var imageName : String
    init(title: String, subtitle: String, buttonTitle: String, imageName: String) {
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.imageName = imageName
    }
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Image(imageName).resizable().frame(width: 300, height: 300)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            Text(subtitle).multilineTextAlignment(.center)
                .font(.subheadline)
            Button {
                
            } label: {
                Text(buttonTitle).padding(20)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            
            Spacer()
        }.padding(.horizontal,50)
    }
}
