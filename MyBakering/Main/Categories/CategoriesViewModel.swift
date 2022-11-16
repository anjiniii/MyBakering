//
//  CategoriesViewModel.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import Foundation

enum CategoriesViewModel: Int, CaseIterable {
    case cookie
    case muffin
    case cake
    case pie
    case bread
    case chocolate
    case etc
    
    var title: String {
        switch self {
        case .cookie: return "쿠키"
        case .muffin: return "머핀"
        case .cake: return "케이크"
        case .pie: return "파이"
        case .bread: return "빵"
        case .chocolate: return "초콜릿"
        case .etc: return "기타"
        }
    }
    
    var description: String {
        switch self {
        case .cookie: return "cookie"
        case .muffin: return "muffin"
        case .cake: return "cake"
        case .pie: return "pie"
        case .bread: return "bread"
        case .chocolate: return "chocolate"
        case .etc: return "etc."
        }
    }
}
