//
//  User.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/17.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let nickname: String
    let profileImageUrl: String?
}
