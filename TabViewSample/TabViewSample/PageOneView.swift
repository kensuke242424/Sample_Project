//
//  PageOneView.swift
//  TabViewSample
//
//  Created by 中川賢亮 on 2022/07/16.
//

import SwiftUI

struct PageOneView: View {
    var body: some View {

        ZStack {   //✅ 背景とテキストを重ねる
            Color.mint //✅ 背景色
            Text("Page1")

        } // ZStack
    } // body
} // View

struct PageOneView_Previews: PreviewProvider {
    static var previews: some View {
        PageOneView()
    }
}
