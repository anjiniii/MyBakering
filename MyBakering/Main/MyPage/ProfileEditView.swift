//
//  ProfileEditView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import SwiftUI

struct ProfileEditView: View {
    var body: some View {
        VStack {
            LoginHeaderView(title: "프로필 편집")
            
            Button {
                
            } label: {
                Image("Profile_Image")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.myBrown)
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 4))
                    .padding(.top, 48)
            }
            
            HStack {
                Text("user.nickname")
                Button {
                    
                } label: {
                    Image(systemName: "pencil")
                        .foregroundColor(Color.gray)
                }
            }
            .font(.title).bold()
            .padding(24)
            
//            Button {
//                //
//            } label: {
//                Text("저장하기")
//                    .font(.headline).bold()
//                    .foregroundColor(.white)
//                    .frame(width: 340, height: 50)
//                    .background(Color.accentColor)
//                    .clipShape(Capsule())
//                    .padding()
//            }
//            .shadow(color: .gray.opacity(0.5), radius: 10)
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView()
    }
}
