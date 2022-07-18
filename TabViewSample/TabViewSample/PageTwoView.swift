//
//  PageTwoView.swift
//  TabViewSample
//
//  Created by 中川賢亮 on 2022/07/16.
//

import SwiftUI

struct PageTwoView: View {
    var body: some View {
        ZStack {   //✅ 背景とテキストを重ねる
            Color.teal //✅ 背景色
            Text("Page2")

        } // ZStack
    }
}

struct PageTwoView_Previews: PreviewProvider {
    static var previews: some View {
        PageTwoView()
    }
}
