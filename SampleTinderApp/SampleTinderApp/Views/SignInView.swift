//
//  SignInView.swift
//  SampleTinderApp
//
//  Created by 中川賢亮 on 2022/06/19.
//

import SwiftUI

struct SignInView: View {

    @State var name = ""
    @State var email = ""
    @State var password = ""

    var body: some View {

        ZStack {
//            Color.red
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.yellow]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 25) {

                Text("Tinder")
                    .font(.system(size: 80, weight: .heavy))
                    .foregroundColor(.white)

                TextField("名前", text: $name)
                //カスタムモディファイア
                    .asSignInTextField()

                TextField("email", text: $email)
                    .asSignInTextField()

                TextField("password", text: $password)
                    .asSignInTextField()

                Button(action: {

                }) {
                    Text("登録")
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 50)
                .background(Color.orange)
                .cornerRadius(10)
            }
            .padding(.horizontal, 50)
        }

    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
