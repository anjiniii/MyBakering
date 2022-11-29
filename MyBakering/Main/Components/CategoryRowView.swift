//
//  CategoryRowView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct CategoryRowView: View {
    let item: CategoriesViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image("category_\(item.description)")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 56, height: 56)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
