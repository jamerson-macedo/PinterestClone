//
//  FullScreenPhotoGalleryView.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 01/04/25.
//

import SwiftUI
import Photos
struct FullScreenPhotoGalleryView: View {
    @Bindable private var viewModel : CreateViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel: CreateViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        GeometryReader{ proxy in
            VStack(spacing:0){
                ZStack {
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.black)
                                .imageScale(.large)
                        }
                        Spacer()
                        
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Next")
                                .foregroundStyle(.red)
                                .fontWeight(.semibold)
                        }
                        
                        
                    }
                    Text("All photos")
                        .font(.headline)
                }
                .padding()
                HStack(spacing:30){
                    ForEach(viewModel.tabs,id: \.self){ tab in
                        VStack(spacing: 8){
                            Text(tab).foregroundStyle(viewModel.selectedTab == tab ? .black : .gray)
                            Rectangle()
                                .fill(viewModel.selectedTab == tab ? .black : .clear)
                                .frame(height : 2)
                        }.onTapGesture {
                            viewModel.selectedTab = tab
                        }
                        
                    }
                }
                .padding(.horizontal)
                ScrollView {
                    LazyVGrid(columns:viewModel.gridItems,spacing:1){
                        ForEach(viewModel.photoAssets, id: \.localIdentifier){ asset in
                            PhotoThumbnailView(asset: asset, size: proxy.size.width / 3)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .onAppear{
                    viewModel.checkPhotoPermission()
                }
                
                
            }
        }
    }
}
struct PhotoThumbnailView: View {
    let asset : PHAsset
    let size : CGFloat
    @State private var image : UIImage?
    private let imageManager = PHCachingImageManager()
    var body: some View {
        ZStack{
            if let image = image {
                Image(uiImage: image).resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:size,height:size)
                    .clipped()
            }
           
        }.onAppear{
            loadImage()
        }
        
    }
    func loadImage() {
        let options = PHImageRequestOptions()

        options.deliveryMode = .opportunistic
        options.isNetworkAccessAllowed = true
        options.resizeMode = .fast
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: size, height: size), contentMode: .aspectFill, options: options) { result, _ in
            if let image = result {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
           
        }
    }
}

#Preview {
    FullScreenPhotoGalleryView(viewModel: CreateViewModel())
}
