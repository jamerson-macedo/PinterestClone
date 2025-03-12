//
//  NotificationView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import SwiftUI

struct NotificationView: View {
    @State private var viewModel = NotificationViewModel()
    @Namespace private var animation
    var body: some View {
        VStack{
            HStack(spacing: 30){
                Button {
                    withAnimation{
                        viewModel.tabSelection = .Updates
                    }
                } label: {
                    TabSelectionView(title: "Updates", width: 70,viewModel: viewModel,tabSelection: .Updates,animation: animation)
                }
                Button {
                    withAnimation{
                        viewModel.tabSelection = .Inbox
                    }
                } label: {
                    TabSelectionView(title: "Inbox", width: 45, viewModel: viewModel,tabSelection: .Inbox,animation: animation)
                }

            }
            switch viewModel.tabSelection {
            case .Updates:
                
                UpdatesView()
            case .Inbox:
                InboxView(viewModel: viewModel)
            }
            Spacer()
        }
    }
}

#Preview {
    NotificationView()
}

struct TabSelectionView: View {
   var animation: Namespace.ID
    private var title : String
    private var width : CGFloat
    @Bindable private var viewModel : NotificationViewModel
    private var tabSelection : NotificationTabSelection
    init(title: String, width: CGFloat,viewModel : NotificationViewModel,tabSelection : NotificationTabSelection,animation: Namespace.ID) {
        self.title = title
        self.width = width
        self._viewModel = Bindable(viewModel)
        self.tabSelection = tabSelection
        self.animation = animation
    }
    var body: some View {
            VStack(spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.darkGray))
                if viewModel.tabSelection == tabSelection {
                    Rectangle()
                        .frame(width: width, height: 4)
                        .foregroundStyle(Color(.darkGray))
                        .matchedGeometryEffect(id: "options", in: animation)
                } else {
                    Rectangle()
                        .frame(width: width, height: 4)
                        .foregroundStyle(.clear)
                }
            }
        
    }
}
