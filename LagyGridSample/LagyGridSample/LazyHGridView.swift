//
//  LazyHGridView.swift
//  LagyGridSample
//
//  Created by 中川賢亮 on 2022/06/20.
//

import SwiftUI

struct LazyHGridView: View {

    // 画面の横幅をiPhoneのフレームラインに合わせる
    private var frameWidth: CGFloat {UIScreen.main.bounds.width}
    private var vGridAdaptiveItem = [GridItem(.adaptive(minimum: 80), spacing: 15)]
    private var vGridFixedItem = [GridItem(.fixed(80), spacing: 15)]
    private var vGridFlexibleItem = [GridItem(.flexible(), spacing: 15)]

    var body: some View {

       Text("")
    } // body
} // View

struct LazyHGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridView()
    }
}
