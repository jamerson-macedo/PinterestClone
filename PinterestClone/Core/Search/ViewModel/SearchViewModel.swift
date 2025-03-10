//
//  SearchViewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 10/03/25.
//

import Foundation
import Observation

@Observable
class SearchViewModel {
    var searchTerm : String = ""
    var title : String = "Search for Ideas"
    var filtredItems : [Item] {
        if searchTerm.isEmpty {
            return items
        }
        return items.filter{
            // verifica se a string é igual idependente das maiusculas
            $0.item_name.localizedCaseInsensitiveContains(searchTerm)
        }
    }
    var items : [Item] = [
        .init(id: UUID().uuidString, item_name: "Blue Wallpaper", isSelected: false, imageName: "wallpaper"),
        .init(id: UUID().uuidString, item_name: "Beach pictures", isSelected: false, imageName: "beach"),
        .init(id: UUID().uuidString, item_name: "Dp for Whatsapp", isSelected: false, imageName: "dp"),
        .init(id: UUID().uuidString, item_name: "Purple aesthetic", isSelected: false, imageName: "easy"),
        .init(id: UUID().uuidString, item_name: "Selfie poses", isSelected: false, imageName: "purple"),
        .init(id: UUID().uuidString, item_name: "Easy dinner recipe", isSelected: false, imageName: "selfie")
    ]
    
}
