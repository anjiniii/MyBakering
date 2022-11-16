//
//  MyPageFilterViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import Foundation

enum MyPageFilterViewModel: Int, CaseIterable {
    case recipes
    case bookmark
    
    var title: String {
        switch self {
        case .recipes: return "내 레시피"
        case .bookmark: return "북마크"
        }
    }
}
