//
//  PageThreeView.swift
//  TabViewSample
//
//  Created by 中川賢亮 on 2022/07/16.
//

import SwiftUI

struct PageThreeView: View {
    var body: some View {
        ZStack {   //✅ 背景とテキストを重ねる
            Color.yellow //✅ 背景色
            Text("Page3")

        } // ZStack
    }
}

struct PageThreeView_Previews: PreviewProvider {
    static var previews: some View {
        PageThreeView()
    }
}
