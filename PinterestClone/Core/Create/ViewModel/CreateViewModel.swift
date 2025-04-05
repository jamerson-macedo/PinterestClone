//
//  CreateViewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import SwiftUI
import Observation
import Photos
@Observable
class CreateViewModel {
    var showCreateBoard : Bool = false
    var showFullScreenGallery : Bool = false
    var boardName : String = ""
    var isSecretBoard : Bool = false
    var showAddPinView : Bool = false
    var title : String = ""
    var description : String = ""
    var link : String = ""
    var tags : String = ""
    var selectedBoard : String = "Profile"
    var showTagSheet : Bool = false
    var searhText : String = "h"
    var selectedTopics : Set<String> = []
    var topicGridItems : [GridItem] = [
        GridItem(.flexible(),spacing : 8),
        GridItem(.flexible(),spacing : 8),
        
    ]
    var showBoardSheet : Bool = false
    private var allTopics : [String] = [
        "Hair care", "Sport", "Halloween", "Happy birthday", "Hand tattoo", "Harley Quinn", "Fashion", "Cute Hairstyles", "Halloween Nails"
    ]
    var displayTopics : [String] {
        var topics = Array(selectedTopics)
        let nonSelectedFilteredTopics = allTopics.filter { topic in
            topic.lowercased().contains(searhText.lowercased()) && !selectedTopics.contains(topic)
        }
        topics.append(contentsOf: nonSelectedFilteredTopics)
        return topics
        
    }
    var pins : [Item] = [
        .init(id: UUID().uuidString, item_name: "Nice car", isSelected: false, imageName: "car"),
        .init(id: UUID().uuidString, item_name: "Best car", isSelected: false, imageName: "dp"),
        .init(id: UUID().uuidString, item_name: "Good car", isSelected: false, imageName: "wallpaper"),
        .init(id: UUID().uuidString, item_name: "car", isSelected: false, imageName: "car"),
        .init(id: UUID().uuidString, item_name: "phone", isSelected: false, imageName: "car")
    ]
    var tabs = ["All", "Videos", "Photos"]
    var selectedTab = "Photos"
    var gridItems = [
        GridItem(.flexible(),spacing : 1),
        GridItem(.flexible(),spacing : 1),
        GridItem(.flexible(),spacing : 1),
    ]
    var photoAssets : [PHAsset] = []
    
    var selectedPhotos : Set<String> = []
    
    func checkPhotoPermission() {
        PHPhotoLibrary.requestAuthorization(for:.readWrite){ status in
            DispatchQueue.main.async{
                if status == .authorized{
                    self.fetchPhotos()
                }
            }
            
        }
    }
    func fetchPhotos() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        var fetchResult : PHFetchResult<PHAsset>
        switch selectedTab {
        case "Videos":
            fetchResult = PHAsset.fetchAssets(with: .video,options: fetchOptions)
        case "Photos":
            fetchResult = PHAsset.fetchAssets(with: .image,options: fetchOptions)
        default:
            fetchResult = PHAsset.fetchAssets(with: fetchOptions)
        }
        photoAssets = fetchResult.objects(at: IndexSet(0 ..< fetchResult.count))
        
    }
    func toggleSelection(_ topic : String){
        if selectedTopics.contains(topic){
            selectedTopics.remove(topic)
        }else {
            selectedTopics.insert(topic)
        }
    }
}
