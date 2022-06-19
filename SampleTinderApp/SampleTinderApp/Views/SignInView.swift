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
        TextField("名前", text: $name)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
