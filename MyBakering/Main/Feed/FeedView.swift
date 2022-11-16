//
//  FeedView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0...20, id: \.self) { _ in
                        RecipeRowView()
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}