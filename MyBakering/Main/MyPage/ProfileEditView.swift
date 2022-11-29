//
//  ProfileEditView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import SwiftUI
import Kingfisher

struct ProfileEditView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var isSaved = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            VStack {
                LoginHeaderView(title: "프로필 편집")
                
                profileImageView
                
                if let selectedImage = selectedImage {
                    Button {
                        viewModel.uploadProfileImage(selectedImage)
                        isSaved = true
                    } label: {
                        CapsuleButtonView(text: "저장하기")
                    }
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                }
                
                Spacer()
            }
            .ignoresSafeArea()
        }
        
        toastView
    }
    
    private var toastView: some View {
        VStack {
            Spacer()
            
            if isSaved {
                Text("저장되었습니다")
                    .foregroundColor(.white).bold()
                    .padding()
                    .background(Color.myLightBrown)
                    .cornerRadius(16)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isSaved = false
                        }
                    }
            }
        }
        .padding(.bottom, 64)
        .animation(.linear(duration: 0.3), value: isSaved)
        .transition(.opacity)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
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
                if let profileImageUrl = viewModel.currentUser?.profileImageUrl {
                    KFImage(URL(string: profileImageUrl))
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
        }
        .padding(.top, 48)
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}
