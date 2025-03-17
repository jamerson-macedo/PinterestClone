//
//  EmptyBoardView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import SwiftUI

struct EmptyBoardView: View {
    @Bindable var viewModel : SavedViewModel
    init(viewModel: SavedViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        EmptySavedView(title: "Keep track of what inspires you", subtitle: "Boards help you organize your pins and save into collections.", buttonTitle: "Create a board", imageName: "paper")
    }
}

#Preview {
    EmptyBoardView(viewModel: SavedViewModel())
}
