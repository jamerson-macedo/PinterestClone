//
//  Item.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 10/03/25.
//

import Foundation

struct Item: Identifiable, Hashable,Codable {
    let id: String
    let item_name: String
    var description : String?
    var link : String?
    var isSelected : Bool
    var uid : String?
    var imageName : String
}
