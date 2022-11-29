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
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                guard let snapshot = snapshot else { return }

                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
            }
    }
}
