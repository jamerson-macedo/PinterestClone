//
//  CreateViewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 11/03/25.
//

import Foundation
import Observation

@Observable
class CreateViewModel {
    var showCreateBoard : Bool = false
    var boardName : String = ""
    var isSecretBoard : Bool = false
    var showAddPinView : Bool = false
    
    var pins : [Item] = [
        .init(id: UUID().uuidString, item_name: "Nice car", isSelected: false, imageName: "car"),
        .init(id: UUID().uuidString, item_name: "Best car", isSelected: false, imageName: "dp"),
        .init(id: UUID().uuidString, item_name: "Good car", isSelected: false, imageName: "wallpaper"),
        .init(id: UUID().uuidString, item_name: "car", isSelected: false, imageName: "car"),
        .init(id: UUID().uuidString, item_name: "phone", isSelected: false, imageName: "car")
    ]
}
