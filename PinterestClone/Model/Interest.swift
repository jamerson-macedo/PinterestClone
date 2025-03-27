//
//  Interest.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 27/03/25.
//

import Foundation
struct Interest : Identifiable, Hashable, Codable {
    let id: String
    var itemName: String
    var imageName: String
    var isSelected : Bool
}
