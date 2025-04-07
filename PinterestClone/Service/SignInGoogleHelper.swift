//
//  SignInGoogleHelper.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 07/04/25.
//

import Foundation
import GoogleSignIn

final class SignInGoogleHelper{
    @MainActor
    func signIn() async throws ->GoogleSignInResultModel{
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.badServerResponse)
        }
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        guard let idToken : String = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken : String = gidSignInResult.user.accessToken.tokenString 
        let email : String = gidSignInResult.user.profile?.email ?? ""
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken, email: email)
        return tokens
    }
}
