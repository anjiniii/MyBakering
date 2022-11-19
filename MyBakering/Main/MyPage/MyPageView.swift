//
//  MyPageView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI
import Kingfisher

struct MyPageView: View {
    @State private var selectedFilter: MyPageFilterViewModel = .recipes
    @EnvironmentObject var authviewModel: AuthViewModel
    @ObservedObject var viewModel: MyPageViewModel
    @Environment(\.dismiss) var dismiss
    @Namespace var animation
    
    init(user: User) {
        self.viewModel = MyPageViewModel(user: user)
    }
    
    var body: some View {
        if let user = authviewModel.currentUser {
            NavigationStack {
                VStack(alignment: .leading) {
                    // headerView
                    ZStack(alignment: .bottomLeading) {
                        Color.myLightBrown
                            .ignoresSafeArea()
                        
                        if let profileImageUrl = user.profileImageUrl {
                            KFImage(URL(string: profileImageUrl))
                                .resizable()
                                .modifier(ProfileImageModifier())
                        } else {
                            Image(user.profileImageUrl ?? "Profile_Image")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color.myBrown)
                                .background(Color.white)
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                .modifier(ProfileImageModifier())
                        }
                        
                    }
                    .frame(height: 64)
                    
                    actionButtons
                    
                    Text(user.nickname)
                        .font(.title).bold()
                        .padding(.horizontal, 20)
                    
                    myPageFilterBar
                    
                    recipesView
                    
                    Spacer()
                }
            }
        }
    }
}

extension MyPageView {
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            NavigationLink {
                ProfileEditView()
            } label: {
                Text("프로필 편집")
                    .font(.subheadline).bold()
                    .frame(width: 100, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
            
            Button {
                authviewModel.signOut()
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
                ForEach(viewModel.recipes) { recipe in
                    RecipeRowView(recipe: recipe)
                }
            }
        }
    }
}

struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 72, height: 72)
            .clipShape(Circle())
            .offset(x: 16, y: 24)
    }
}
