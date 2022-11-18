//
//  AuthViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/17.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(Auth.auth().currentUser?.uid ?? "nil")")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
//            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, nickname: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            let data = ["email": email,
                        "nickName": nickname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    
                }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}