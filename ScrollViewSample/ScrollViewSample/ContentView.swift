//
//  ContentView.swift
//  ScrollViewSample
//
//  Created by 中川賢亮 on 2022/07/20.
//

import SwiftUI

// 独自の子View
struct RowText: View {

    // 画面に出力されるテキストが格納される
    let outputText: String

    // イニシャライザー(最初に動くメソッド)
    init(_ inputText: String) {
        // プリント出力
        print(inputText)
        // 親Viewから渡された「inputText」を「outputText」に格納
        outputText = inputText
    }

    var body: some View {
        Text(outputText)
    } // body
} // View

struct ContentView: View {
    var body: some View {

        ScrollView {
            LazyVStack {

                ForEach(1..<100) { index in
                    // 子Viewを呼び出し
                    RowText("データ\(index)")
                } // ForEach

            } // LazyVStack
        } // ScrollView
    } // body
} // View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
