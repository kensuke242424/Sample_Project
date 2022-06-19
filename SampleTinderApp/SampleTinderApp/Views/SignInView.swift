//
//  SignInView.swift
//  SampleTinderApp
//
//  Created by 中川賢亮 on 2022/06/19.
//

import SwiftUI

struct SignInView: View {

    @State var name = ""

    var body: some View {

        ZStack {
            Color.red
                .ignoresSafeArea()

            VStack {
                TextField("名前", text: $name)
                    .frame(height: 50)
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(Color.white)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(.init(white: 0.85, alpha: 1))))

                TextField("名前", text: $name)

                TextField("名前", text: $name)
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
