//
//  UserService.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//


import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserService {
    
//    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
//        Firestore.firestore().collection("users")
//            .document(uid)
//            .getDocument { snapshot, error in
//                guard let data = snapshot?.data() else { return }
//                print("DEBUG: User data is \(data)")
//
//                let id = data["uid"] as? String ?? ""
//                let email = data["email"] as? String ?? ""
//                let nickname = data["nickname"] as? String ?? ""
//
//                let user = User(email: email, nickname: nickname)
//
//                print("DEBUG: User uid is \(user.nickname)")
//                completion(user)
//            }
//    }
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                guard let snapshot = snapshot else { return }

                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
            }
    }
    
//    func fetchUsers(completion: @escaping([User]) -> Void) {
//        Firestore.firestore().collection("users")
//            .getDocuments { snapshot, error in
//                guard let documents = snapshot?.documents else { return }
//                let users = documents.compactMap({ try? $0.data(as: User.self)})
//                completion(users)
//            }
//    }
    
}
