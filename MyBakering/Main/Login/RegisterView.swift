//
//  RegisterView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/17.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var nickname = ""
    @State private var password = ""
    
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                LoginHeaderView(title: "반갑습니다 👋")
                
                VStack(spacing: 40) {
                    emailTextField
                    nicknameTextField
                    passwordTextField
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                .focused($textFieldIsFocused)
                
                Button {
                    // register
                } label: {
                    Text("시작하기")
                        .font(.headline).bold()
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.accentColor)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10)
                
                Spacer()
                
                NavigationLink {
                    LoginView()
                        .toolbar(.hidden, for: .navigationBar)
                } label: {
                    HStack {
                        Text("이미 계정이 있나요?")
                            .font(.footnote)
                        
                        Text("로그인하기")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
                .foregroundColor(Color.accentColor)
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("완료") {
                        textFieldIsFocused = false
                    }
                }
            }
        }
    }
    
    var emailTextField: some View {
        VStack {
            HStack {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField("이메일", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
    
    var nicknameTextField: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField("닉네임", text: $nickname)
                    .textInputAutocapitalization(.never)
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
    
    var passwordTextField: some View {
        VStack {
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                SecureField("비밀번호", text: $password)
                    .textInputAutocapitalization(.never)
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
