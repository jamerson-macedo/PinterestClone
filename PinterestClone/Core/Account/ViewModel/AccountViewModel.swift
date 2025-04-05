//
//  AccountViewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 05/04/25.
//

import Foundation
import Observation

@Observable
class AccountViewModel {
    func signOut() {
        AuthService.shared.signOut()
    }
}
