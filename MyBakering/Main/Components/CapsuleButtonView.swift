//
//  CapsuleButtonView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/18.
//

import SwiftUI

struct CapsuleButtonView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline).bold()
            .foregroundColor(.white)
            .frame(width: 340, height: 50)
            .background(Color.accentColor)
            .clipShape(Capsule())
            .padding()
    }
}

struct CapsuleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButtonView(text: "로그인")
    }
}
