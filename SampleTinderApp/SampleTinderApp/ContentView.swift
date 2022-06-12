//
//  ContentView.swift
//  SampleTinderApp
//
//  Created by 中川賢亮 on 2022/06/09.
//

import SwiftUI

struct ContentView: View {

    enum SelectedItem {
        case tinder,good,comment,profile
    }

    // 画面の横幅をiPhoneのフレームラインに合わせる
    private var frameWidth: CGFloat {UIScreen.main.bounds.width}

    @State var selectedItem: SelectedItem = .good

    var body: some View {

        VStack {

            // 上部ボタン ここから
            HStack() {

                Button (action: {
                    selectedItem = .profile
                }) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(selectedItem == .profile ? .pink : .gray)
                    
                }

                Spacer()

                ZStack {
                    // 楕円形枠ボタン
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.white)
                        // 縦と横の値をそれぞれ別の値で指定できるように
                        .frame(width: 50, height: 40)
                        .shadow(radius: 10)

                    Button (action: {
                        selectedItem = .good
                    }) {
                        Image(systemName: "flame.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 25, alignment: .center)
                            .foregroundColor(selectedItem == .good ? .red : .gray)

                    }
                } // ZStack

                ZStack {
                    // 楕円形枠ボタン
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.white)
                        // 縦と横の値をそれぞれ別の値で指定できるように
                        .frame(width: 50, height: 40)
                        .shadow(radius: 10)

                    Button (action: {
                        selectedItem = .tinder
                    }) {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 25, alignment: .center)
                            .foregroundColor(selectedItem == .tinder ? .green : .gray)

                    }
                } // ZStack

                Spacer()

                Button (action: {
                    selectedItem = .comment
                }) {
                    // Image(systemName: "<シンボル名>") ← これでSFSymbolのアイコンが呼び出せます
                    Image(systemName: "message.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(selectedItem == .comment ? .yellow : .gray)
                }
                
            }// HStack
            .padding()
            .frame(width: frameWidth, height: 50)

            // 上部ボタンここまで

            // 写真が表示される部分
            Text("Image")
                .padding()
                .frame(width: frameWidth, height: 600)
                .background(Color.blue)


            // 画面下部のボタン
            HStack(spacing: 20) {
                CircleButtonView(imageName: "gobackward", imageSize: 20, backGroundSize: 40)
                CircleButtonView(imageName: "xmark", imageSize: 20, backGroundSize: 50)
                CircleButtonView(imageName: "star.fill", imageSize: 20, backGroundSize: 40)
                CircleButtonView(imageName: "suit.heart.fill", imageSize: 20, backGroundSize: 50)
                CircleButtonView(imageName: "bolt.fill", imageSize: 15, backGroundSize: 40)
            }

        } // VStack
    } // body
} // View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

