//
//  UserData.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 05/04/25.
//

import Foundation

struct UserData : Identifiable, Hashable, Codable {
    var id: String
    var email: String
    var name: String
    var gender : String
    var birthdate : String
    var interests : [Interest]
    var pins : [Item]
    var boards : [Board]
}
