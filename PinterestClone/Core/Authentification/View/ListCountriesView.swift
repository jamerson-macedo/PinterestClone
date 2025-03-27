//
//  ListCountriesView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 25/03/25.
//

import SwiftUI

struct ListCountriesView: View {
    @Bindable private var viewModel : LoginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel : LoginViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    Text("For your language, we use the language selected in your phone settings.")
                        .font(.headline)
                        .foregroundStyle(Color(.darkGray))
                    ForEach(Locale.isoRegionCodes,id: \.self){ code in
                        if let coutryName = Locale.current.localizedString(forRegionCode: code){
                            Text(coutryName)
                                .fontWeight(.bold)
                                .padding(.top)
                                .onTapGesture {
                                    viewModel.country = coutryName
                                    dismiss()
                                }
                        }
                    }
                }.padding()
            }.scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack{
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .onTapGesture {
                                    dismiss()
                                }
                            Text("Country/region")
                        }
                    }
                }
        }
    }
}

#Preview {
    ListCountriesView(viewModel: LoginViewModel())
}
