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
}
