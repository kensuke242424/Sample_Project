//
//  ContentView.swift
//  SampleTinderApp
//
//  Created by 中川賢亮 on 2022/06/09.
//

import SwiftUI

struct ContentView: View {

    // 画面の横幅をiPhoneのフレームラインに合わせる
    private var frameWidth: CGFloat {UIScreen.main.bounds.width}

    var body: some View {

        VStack {

            // 画面上部のボタン
            HStack() {

                ButtonView(imageName: "person.fill", imageSize: 30)
                Spacer()
                EllipseButtonStyleView(imageName: "flame.fill", imageSize: 20, backGroundWidthSize: 50, backGroundHeightSize: 40)
                EllipseButtonStyleView(imageName: "leaf.fill", imageSize: 20, backGroundWidthSize: 50, backGroundHeightSize: 40)
                Spacer()
                ButtonView(imageName: "message.fill", imageSize: 30)
            }// HStack
            .padding()
            .frame(width: frameWidth, height: 50)

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

