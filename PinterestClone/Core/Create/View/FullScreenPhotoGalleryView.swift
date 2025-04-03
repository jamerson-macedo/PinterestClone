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
                            viewModel.fetchPhotos()
                        }
                        
                    }
                }
                .padding(.horizontal)
                ScrollView {
                    LazyVGrid(columns:viewModel.gridItems,spacing:1){
                        ForEach(viewModel.photoAssets, id: \.localIdentifier){ asset in
                            PhotoThumbnailView(asset: asset, size: proxy.size.width / 3,isSelected: viewModel.selectedPhotos.contains(asset.localIdentifier)).onTapGesture {
                                if viewModel.selectedPhotos.contains(asset.localIdentifier){
                                    viewModel.selectedPhotos.remove(asset.localIdentifier)
                                }else {
                                    viewModel.selectedPhotos.insert(asset.localIdentifier)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.bottom,viewModel.selectedPhotos.isEmpty ? 0 : 100)
                .onAppear{
                    
                    viewModel.checkPhotoPermission()
                }
                if !viewModel.selectedPhotos.isEmpty {
                    SelectedPhotoBar(selectedPhotos: viewModel.photoAssets.filter{
                        viewModel.selectedPhotos.contains($0.localIdentifier)
                    }, onRemove:{ asset in
                        viewModel.selectedPhotos.remove(asset.localIdentifier)
                        
                    })
                }
                
            }
        }
    }
}
struct SelectedPhotoBar: View {
    let selectedPhotos : [PHAsset]
    let onRemove: (PHAsset) -> Void
    var body: some View {
        VStack(spacing:0){
            Divider()
            ScrollView(.horizontal) {
                HStack(spacing:8){
                    ForEach(selectedPhotos,id: \.localIdentifier){ asset in
                        SelectedPhotoThumbnailView(asset: asset, size: 70){
                            onRemove(asset)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical,8)
            }
        }
    }
}
struct SelectedPhotoThumbnailView: View {
    let asset : PHAsset
    let size : CGFloat
    let onRemove: () -> Void
    @State private var image : UIImage?
    private let imageManager = PHCachingImageManager()
    var body: some View {
        ZStack(alignment : .topTrailing){
            if let image = image {
                Image(uiImage: image).resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:size,height:size)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
            Button {
                onRemove()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.white)
                    .background(Circle().fill(.black.opacity(0.5)))
                    .font(.system(size: 18))
            }
            .padding(4)

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
struct PhotoThumbnailView: View {
    let asset : PHAsset
    let size : CGFloat
    let isSelected : Bool
    @State private var image : UIImage?
    private let imageManager = PHCachingImageManager()
    var body: some View {
        ZStack(alignment : .topTrailing){
            if let image = image {
                Image(uiImage: image).resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:size,height:size)
                    .clipped()
                
            }
            if isSelected{
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.blue)
                    .background(Circle().fill(Color.white))
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
