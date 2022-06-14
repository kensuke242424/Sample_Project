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

            CardView()

            // 下部ボタン呼び出し
            BottomControlView()


        } // VStack
    } // body
} // View

struct CardView: View {

    // 画面の横幅をiPhoneのフレームラインに合わせる
    private var frameWidth: CGFloat {UIScreen.main.bounds.width}

    var body: some View {

        GeometryReader(content: { geometry in

            Image("man1")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.blue)


        })



    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

