//
//  LoginView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/17.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                LoginHeaderView(title: "안녕하세요 👋")
                
                VStack(spacing: 40) {
                    emailTextField
                    passwordTextField
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                .focused($textFieldIsFocused)
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("로그인")
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
                    RegisterView()
                        .toolbar(.hidden, for: .navigationBar)
                } label: {
                    HStack {
                        Text("아직 계정이 없나요?")
                            .font(.footnote)
                        
                        Text("계정 만들기")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
