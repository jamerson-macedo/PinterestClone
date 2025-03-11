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
}
