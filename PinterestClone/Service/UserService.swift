//
//  UserService.swift
//  PinterestClone
//
//  Created by Jamerson Macedo on 05/04/25.
//

import Foundation
import Observation
import FirebaseAuth
import Firebase
@Observable
class UserService {
    var currentUser: UserData?
    static let shared = UserService()
    init() {
        Task {try await fetchCurrentUser()}
    }
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try snapshot.data(as: UserData.self)
    }
    func reset (){
        self.currentUser = nil
    }
}
