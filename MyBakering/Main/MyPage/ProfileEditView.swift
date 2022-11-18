//
//  ProfileEditView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import SwiftUI

struct ProfileEditView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            LoginHeaderView(title: "프로필 편집")
            
            profileImageView
            
            HStack {
                Text("user.nickname")
                    .foregroundColor(.myDarkBrown)
                Button {
                    
                } label: {
                    Image(systemName: "pencil")
                        .foregroundColor(Color.gray)
                }
            }
            .font(.title).bold()
            .padding(24)
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("저장하기")
                        .font(.headline).bold()
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.accentColor)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView()
    }
}

extension ProfileEditView {
    var profileImageView: some View {
        Button {
            showImagePicker.toggle()
        } label: {
            if let profileImage = profileImage {
                profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
            } else {
                Image("Profile_Image")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.myBrown)
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 4))
            }
        }
        .padding(.top, 48)
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}
