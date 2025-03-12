//
//  MainTabView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 10/03/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var viewModel = MainTabViewModel()
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            Text("Home").tabItem {
                Label("Home",systemImage: "house.fill")
            }.tag(0)
            SearchView().tabItem {
                Label("Search",systemImage: "magnifyingglass")
            }.tag(1)
            Color.clear
                .tabItem {
                Label("Create",systemImage: "plus")
            }.tag(2)
            NotificationView().tabItem {
                Label("Notifications",systemImage: "ellipsis.message.fill")
            }.tag(3)
            Text("Saved").tabItem {
                Label("Saved",systemImage: "person")
            }.tag(4)
        }
        .onChange(of: viewModel.selectedTab,{ old, new in
            if new == 2 {
                // não quero abrir uma nova tela entao o old tem que ser o selected tab
                viewModel.selectedTab = old
                viewModel.showCreateMenu = true
                viewModel.isFullscreen = false
            }
            
        })
        .sheet(isPresented: $viewModel.showCreateMenu){
            CreateView(isFullScreen: $viewModel.isFullscreen)
                .presentationDetents(viewModel.isFullscreen ? [.large] : [.height(250)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    MainTabView()
}
