//
//  MyPageView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct MyPageView: View {
    @State private var selectedFilter: MyPageFilterViewModel = .recipes
    @Environment(\.dismiss) var dismiss
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            Text("이오이오링")
                .font(.title).bold()
                .padding(.horizontal, 20)
            
            myPageFilterBar
            
            recipesView
            
            Spacer()
        }
    }
}

extension MyPageView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color.myLightBrown
                .ignoresSafeArea()
            
            Circle()
//                    .resizable()
//                    .scaledToFill()
//                    .clipShape(Circle())
                .foregroundColor(.white)
                .frame(width: 72, height: 72)
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                .offset(x: 16, y: 24)
        }
        .frame(height: 64)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Button {
                //
            } label: {
                Text("프로필 편집")
                    .font(.subheadline).bold()
                    .frame(width: 100, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
            
            Button {
                //
            } label: {
                Text("로그아웃")
                    .font(.subheadline).bold()
                    .frame(width: 80, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
        .padding(.top, 6)
    }
    
    var myPageFilterBar: some View {
        HStack {
            ForEach(MyPageFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color.accentColor)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
        .padding(.top)
    }
    
    var recipesView: some View {
        ScrollView {
            LazyVStack {
                ForEach( 0...20, id: \.self) { _ in
                    RecipeRowView()
                }
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
