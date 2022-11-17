//
//  LoginHeaderView.swift
//  MyBakering
//
//  Created by 이안진 on 2022/11/17.
//

import SwiftUI

struct LoginHeaderView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            
            Text(title)
                .font(.largeTitle).bold()
                .padding(.top, 72)
        }
        .frame(height: 240)
        .padding(.leading)
        .background(Color.myLightBrown)
        .foregroundColor(.white)
        .clipShape(RoundedShape(coners: [.bottomRight]))
    }
}

struct RoundedShape: Shape {
    var coners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: coners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}

struct LoginHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeaderView(title: "안녕하세요👋")
    }
}
