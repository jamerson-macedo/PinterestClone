//
//  AuthService.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 05/04/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase
import Observation
import GoogleSignIn
@Observable
class AuthService{
    static let shared = AuthService()
    var userSession: FirebaseAuth.User?
    init(){
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func createUser(email: String, password: String,name : String, gender :String, birthDate : String, selectedInterests : [Interest]) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try  await uploadUserData(name:name,email: email, id: result.user.uid, gender: gender, birthDate: birthDate, selectedInterests: selectedInterests)
        } catch {
            print("FAILED TO CREATE USER \(error.localizedDescription)")
        }
        
    }
    @MainActor
    private func uploadUserData(name : String,email: String, id: String, gender :String, birthDate : String, selectedInterests : [Interest]) async throws{
        
        let user = UserData(id: id, email: email, name:name , gender: gender, birthdate: birthDate, interests: selectedInterests, pins: [], boards: [])
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        
    }
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    func checkIfEmailExists(email: String) async -> Bool {
        do {
           let querySnapshot = try await  Firestore.firestore().collection("users").whereField("email", isEqualTo: email).getDocuments()
            return !querySnapshot.isEmpty
        }catch{
            print("Error checking")
            return false
        }
    }
    @MainActor
    func login(email:String, password : String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        }catch{
            print("Failded login\(error.localizedDescription)")
        }
    }
    
}
extension AuthService{
    func signIn(credential : AuthCredential) async throws -> User{
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return authDataResult.user
        
    }
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws{
        do{
            let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
            self.userSession = try await self.signIn(credential: credential)
            if let email = userSession?.email{
                // se o email ja existe então faz so o login se não faz o upload
                if await !checkIfEmailExists(email: email){
                    try await uploadUserData(name: userSession?.displayName ?? "", email: userSession?.email ?? "", id: userSession?.uid ?? UUID().uuidString, gender: "", birthDate: "", selectedInterests: [])
                }else {
                    try await UserService.shared.fetchCurrentUser()
                }
            }
            
        }catch{
            print("Error during google signIn \(error.localizedDescription)")
        }
    }
}
