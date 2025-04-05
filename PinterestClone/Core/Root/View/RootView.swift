//
//  RootView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 05/04/25.
//

import SwiftUI

struct RootView: View {
    @State private var viewModel = RootViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    RootView()
}
