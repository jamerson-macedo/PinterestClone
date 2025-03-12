//
//  HomeVIewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 12/03/25.
//

import Foundation
import Observation

@Observable
class HomeViewModel {
    var items : [Item] = [
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "egito1"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "egito2"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "dp"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "easy"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "purple"),
        .init(id: UUID().uuidString, item_name: "", isSelected: false, imageName: "selfie")
        
    ]
}
