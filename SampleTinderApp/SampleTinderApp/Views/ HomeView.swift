//
//  ContentView.swift
//  SampleTinderApp
//
//  Created by 中川賢亮 on 2022/06/09.
//

import SwiftUI

struct  HomeView: View {

    enum SelectedItem {
        case tinder,good,comment,profile
    }

    // 画面の横幅をiPhoneのフレームラインに合わせる
    private var frameWidth: CGFloat {UIScreen.main.bounds.width}

    @State var selectedItem: SelectedItem = .good

    var body: some View {

        VStack {

            // 上部ボタン呼び出し
           TopControloView()

            // 写真が表示される部分
            Text("Image")
                .padding()
                .frame(width: frameWidth, height: 600)
                .background(Color.blue)

            // 下部ボタン呼び出し
            BottomControlView()
           

        } // VStack
    } // body
} // View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
         HomeView()
    }
}

