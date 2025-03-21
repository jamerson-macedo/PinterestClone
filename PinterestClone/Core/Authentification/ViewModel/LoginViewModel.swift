//
//  LoginViewModel.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 17/03/25.
//

import Foundation
import Observation

@Observable
class LoginViewModel {
    var email: String = ""
    var showSignInView : Bool = false
    var isSecureField : Bool = true
    var password: String = ""
}
