//
//  InboxView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import SwiftUI

struct InboxView: View {
    @Bindable private var viewModel = NotificationViewModel()
    init(viewModel: NotificationViewModel){
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        VStack(alignment : .leading){
            SearchBarView(text:$viewModel.searchText, title: "Saerch for Ideas",showImageIcon: false)
            InboxCell(image: "square.and.pencil", title: "New message")
            InboxCell(image: "person.fill.badge.plus", title: "Invite friends",subtitle: "Connect to start chatting")
            Spacer()
        }
    }
}

#Preview {
    InboxView(viewModel: NotificationViewModel())
}

struct InboxCell: View {
    private var image : String
    private var title : String
    private var subtitle : String?
    init(image: String, title: String,subtitle : String? = nil) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
    var body: some View {
        HStack{
            Circle()
                .fill(subtitle != nil ? Color(.systemGray6) : .red)
                .frame(width: 50,height: 50)
                .overlay {
                    Image(systemName: image)
                        .foregroundStyle(subtitle != nil ? .black :.white)
                        .fontWeight(.bold)
                        .imageScale(.large)
                        .padding(.bottom,5)
                }
            VStack(alignment : .leading){
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                if let subtitle = subtitle{
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
            }
        }
        .padding()
    }
}
