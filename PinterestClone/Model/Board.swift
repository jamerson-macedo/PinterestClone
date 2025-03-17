//
//  Board.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import Foundation
struct Board: Identifiable,Hashable, Codable {
    var id: String
    var board_name: String
    var pin : [String]
    var tags : [String]?
    var isSecret : Bool
    var uid : String?
}
