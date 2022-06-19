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
            Color.red
                .ignoresSafeArea()

            VStack {
                TextField("名前", text: $name)
                    //カスタムモディファイア
                    .asSignInTextField()

                TextField("名前", text: $name)
                    .asSignInTextField()

                TextField("名前", text: $name)
                    .asSignInTextField()
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
