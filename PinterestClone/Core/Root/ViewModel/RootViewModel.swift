//
//  RootViewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 05/04/25.
//

import Foundation
import Observation
import FirebaseAuth

@Observable
class RootViewModel {
    // tenho a instancia la do inicializador
    var userSession : FirebaseAuth.User? {
        AuthService.shared.userSession
    }
}


