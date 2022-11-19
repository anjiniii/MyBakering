//
//  NewRecipeView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/16.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var recipeImageUrl = ""
    @State private var name = ""
    @State private var description = ""
    @State private var selectedCategory = "기타"
    @State private var ingredients = [String]()
    @State private var steps = [String]()
    
    let categories = ["쿠키", "머핀", "케이크", "파이", "빵", "초콜릿", "기타"]
    @State private var newIngredient = ""
    @State private var newStep = ""
    
    @ObservedObject var viewModel = UploadRecipeViewModel()
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var recipeImage: Image?
    
    
    var body: some View {
        NavigationStack {
            List {
                // 레시피 사진
                Section {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        if let recipeImage = recipeImage {
                            recipeImage
                                .resizable()
                                .scaledToFill()
                                .frame(height: 280)
                                .listRowBackground(Color.clear)
                        } else {
                            HStack {
                                Text("사진 추가")
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "plus.circle.fill")
                            }
                        }
                    }
                }
                .sheet(isPresented: $showImagePicker,
                       onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                
                // 레시피 정보
                Section {
                    Text("레시피 정보")
                        .font(.headline)
                        .listRowBackground(Color.accentColor)
                        .foregroundColor(.white)
                    TextField("이름", text: $name)
                    TextField("설명", text: $description, axis: .vertical)
                    
                    Picker("카테고리", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { Text($0) }
                    }
                }
                
                // 재료 추가
                Section {
                    Text("재료 추가하기")
                        .font(.headline)
                        .listRowBackground(Color.accentColor)
                        .foregroundColor(.white)
                    TextField("재료", text: $newIngredient, axis: .vertical)
//                    TextField("양", text: $newVolume)
                    Button {
                        addIngredient(ingredient: newIngredient)
                    } label: {
                        HStack {
                            Spacer()
                            Text("추가하기")
                            Spacer()
                        }
                        .foregroundColor(.white).bold()
                    }
                    .listRowBackground(Color.myLightBrown)
                } header: {
                    Text("'Edit' 버튼을 눌러 재료와 과정을 수정할 수 있습니다.")
                }
                
                // 재료
//                Section {
//                    ForEach(0 ..< ingredients.count, id: \.self) { i in
//                        HStack {
//                            Text(ingredients[i][0])
//                            Text(ingredients[i][1])
//                        }
//                    }
//                    .onDelete(perform: deleteIngredient)
//                    .onMove(perform: moveIngredient)
//                } header: {
//                    ingredients.count == 0 ? Text("") : Text("재료")
//                }
                Section {
                    ForEach(0 ..< ingredients.count, id: \.self) { i in
                        HStack {
                            Text(ingredients[i])
                        }
                    }
                    .onDelete(perform: deleteIngredient)
                    .onMove(perform: moveIngredient)
                } header: {
                    ingredients.count == 0 ? Text("") : Text("재료")
                }
                
                // 과정 추가
                Section {
                    Text("과정 추가하기")
                        .font(.headline)
                        .listRowBackground(Color.accentColor)
                        .foregroundColor(.white)
                    HStack {
                        Image(systemName: "\(steps.count + 1).square.fill")
                            .foregroundColor(Color.myLightBrown)
                        TextField("과정", text: $newStep, axis: .vertical)
                    }
                    Button {
                        addStep(step: newStep)
                    } label: {
                        HStack {
                            Spacer()
                            Text("추가하기")
                            Spacer()
                        }
                        .foregroundColor(.white).bold()
                    }
                    .listRowBackground(Color.myLightBrown)
                }
                
                // 과정
                Section {
                    ForEach(0 ..< steps.count, id: \.self) { i in
                        HStack {
                            Image(systemName: "\(i + 1).square.fill")
                                .foregroundColor(Color.myLightBrown)
                            Text(steps[i])
                        }
                    }
                    .onDelete(perform: deleteStep)
                    .onMove(perform: moveStep)
                } header: {
                    steps.count == 0 ? Text("") : Text("과정")
                }
                
                // 레시피 추가
                Section {
                    Button {
                        if let selectedImage = selectedImage {
                            viewModel.uploadRecipe(recipeImage: selectedImage,
                                                   name: name,
                                                   description: description,
                                                   selectedCategory: selectedCategory,
                                                   ingredients: ingredients,
                                                   steps: steps)
                        }
                        resetRecipe()
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("레시피 저장")
                            Spacer()
                        }
                        .foregroundColor(.white).bold()
                    }
                    .listRowBackground(Color.accentColor)
                }
                
            }
            .navigationTitle("새로운 레시피 추가")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
            }
            .scrollContentBackground(.hidden)
            .background(Color.myGray)
        }
    }
    
//    private func addIngredient(ingredient: String, volume: String) {
//        self.ingredient.append(ingredient)
//        self.ingredient.append(volume)
//
//        self.ingredients.append(self.ingredient)
//
//        self.ingredient = [String]()
//        self.newIngredient = ""
//        self.newVolume = ""
//    }
    
    private func addIngredient(ingredient: String) {
        self.ingredients.append(ingredient)
        self.newIngredient = ""
    }
    
    private func addStep(step: String) {
        self.steps.append(step)
        self.newStep = ""
    }
    
    func deleteIngredient(indexSet: IndexSet) {
        indexSet.forEach { index in
            ingredients.remove(at: index)
        }
    }
        
    func moveIngredient(from Source: IndexSet, to destination: Int) {
        ingredients.move(fromOffsets: Source, toOffset: destination)
    }
    
    func deleteStep(indexSet: IndexSet) {
        indexSet.forEach { index in
            steps.remove(at: index)
        }
    }
        
    func moveStep(from Source: IndexSet, to destination: Int) {
        steps.move(fromOffsets: Source, toOffset: destination)
    }
    
    func resetRecipe() {
        self.recipeImageUrl = ""
        self.name = ""
        self.description = ""
        self.selectedCategory = "기타"
        self.ingredients = [String]()
        self.steps = [String]()
        self.recipeImage = nil
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        recipeImage = Image(uiImage: selectedImage)
    }
    
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()    }
}
