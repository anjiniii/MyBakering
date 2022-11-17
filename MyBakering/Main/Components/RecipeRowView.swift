//
//  RecipeRowView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct RecipeRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 20) {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.accentColor)
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("초코칩 쿠키")
                            .font(.title3).bold()
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark")
                        }
                        .padding(.horizontal)
                    }
                    Text("네모난 초코칩이 촉촉촉 \n초코 초코 초코칩 냠냠")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    HStack {
                        Image(systemName: "person.fill")
                        Text("이오이오링")
                    }
                    .font(.footnote)
                    .foregroundColor(Color(.darkGray))
                }
            }
            .padding(16)
            
            Divider()
        }
    }
}

struct RecipeRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView()
    }
}
