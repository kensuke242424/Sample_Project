//
//  ContentView.swift
//  TabViewSample
//
//  Created by 中川賢亮 on 2022/07/16.
//

import SwiftUI

struct ContentView: View {

    // タブの選択項目を保持する
    @State var selection = 1

    var body: some View {

        TabView(selection: $selection) {

            PageOneView()
                .tag(1)
                .badge(3)

            PageTwoView()
                .tag(2)
                .badge("New")

            PageThreeView()
                .tag(3)

        } // TabView ここまで
        .tabViewStyle(.page)   //✅ TabViewの表示スタイル変更

    } // body
} // View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
