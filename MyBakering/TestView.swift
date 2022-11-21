//
//  TestView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/19.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
//            GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 200, height: 700)
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 300)
                    
                VStack {
                    Image("cookie_photo")
                        .resizable()
                        .scaledToFill()
                        .frame(maxHeight: 300)
                }
            }
//            }
        }
        .ignoresSafeArea()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
