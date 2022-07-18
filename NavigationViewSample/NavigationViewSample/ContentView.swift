//
//  ContentView.swift
//  NavigationViewSample
//
//  Created by 中川賢亮 on 2022/07/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {

            List { // ✅ リストでリンクアイテムを管理

                NavigationLink(destination: Text("🍊").font(.system(size: 200))) {

                    Text("オレンジ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                } // 🍊

                NavigationLink(destination: Text("🍎").font(.system(size: 200))) {

                    Text("リンゴ")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                } // 🍎

                NavigationLink(destination: Text("🍋").font(.system(size: 200))) {

                    Text("レモン")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                } // 🍋

                NavigationLink(destination: Text("🍓").font(.system(size: 200))) {

                    Text("いちご")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                } // 🍓

            } // List ここまで

            Text("フルーツを選択してください")  // ✅

                .navigationTitle("フルーツを選ぶ")
        } // NavigationView ここまで


    } // bady
} // View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
