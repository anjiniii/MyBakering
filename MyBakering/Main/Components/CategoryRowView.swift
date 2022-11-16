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
            Circle()
//                .resizable()
//                .scaledToFill()
//                .clipShape(Circle())
                .foregroundColor(Color(.systemBrown))
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

//struct CategoryRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryRowView()
//    }
//}
