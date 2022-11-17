//
//  NewRecipeView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var name = ""
    @State private var description = ""
    
    let categories = ["쿠키", "머핀", "케이크", "파이", "빵", "초콜릿", "기타"]
    @State private var selectedCategory = "기타"
    
    @State private var ingredientTitle1 = ""
    @State private var ingredient1 = ""
    
    
    var body: some View {
        NavigationStack {
            List {
                // 레시피 사진
                Section {
                    Button {
                        
                    } label: {
                        HStack {
                            Text("사진 추가")
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
                
                // 레시피 정보
                Section {
                    TextField("이름", text: $name)
                    TextField("설명", text: $description)
                    
                    Picker("카테고리", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { Text($0) }
                    }
                } header: {
                    Text("레시피 정보")
                }
                
                // 재료 목록 1
                Section {
                    TextField("재료 목록 이름", text: $ingredientTitle1)
                    HStack {
                        TextField("재료", text: $ingredient1)
                        Button {
                            
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                    
                    
                    
                } header: {
                    Text((ingredientTitle1 == "") ? "재료" : ingredientTitle1)
                }
                
                // 재료 목록 추가하기
                Section {
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("재료 목록 추가")
                            Spacer()
                        }
                        .foregroundColor(.black)
                    }
                }
                
                // 과정 1
                Section {
                    TextField("과정 이름", text: $ingredientTitle1)
                    HStack {
                        TextField("과정", text: $ingredient1)
                        Button {
                            
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                    
                    
                    
                } header: {
                    Text((ingredientTitle1 == "") ? "과정" : ingredientTitle1)
                }
                
                // 재료 목록 추가하기
                Section {
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("과정 목록 추가")
                            Spacer()
                        }
                        .foregroundColor(.black)
                    }
                }
                
            }
//            .listStyle(.sidebar)
            .navigationTitle("새로운 레시피 추가")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("저장하기") {
                        
                    }
                }
            }
        }
    }
    
    
}

struct coloredImage: View {
    let systemName: String
    let color: Color
    var body: some View {
        Image(systemName: systemName)
            .foregroundColor(color)
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
//        coloredImage()
    }
}


//                    Button {
//
//                    } label: {
//                        Image("add_photo")
//                            .resizable()
//                            .renderingMode(.template)
//                            .foregroundColor(Color(.systemBrown))
//                            .scaledToFill()
//                            .frame(width: 160, height: 160)
//                            .clipShape(Circle())
//                    }
