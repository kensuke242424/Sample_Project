//
//  BottomControlView.swift
//  SampleTinderApp
//
//  Created by 中川賢亮 on 2022/06/13.
//

import SwiftUI

struct BottomControlView: View {

    // 画面の横幅をiPhoneのフレームラインに合わせる
    private var frameWidth: CGFloat {UIScreen.main.bounds.width}

    var body: some View {

        // 画面下部のボタン
        HStack(spacing: 20) {
            BottomButtonView(imageName: "gobackward", imageSize: 20, backGroundSize: 40)
            BottomButtonView(imageName: "xmark", imageSize: 20, backGroundSize: 50)
            BottomButtonView(imageName: "star.fill", imageSize: 20, backGroundSize: 40)
            BottomButtonView(imageName: "suit.heart.fill", imageSize: 20, backGroundSize: 50)
            BottomButtonView(imageName: "bolt.fill", imageSize: 15, backGroundSize: 40)
        }
    }
}


struct BottomButtonView: View {

    var imageName: String
    var imageSize: CGFloat
    // 丸枠のframe数値を呼び出し時に渡す
    var backGroundSize: CGFloat







    var body: some View {

        // ✅丸枠のボタンView
        ZStack {

            // 丸枠を作成
            Color.white.frame(width: backGroundSize, height: backGroundSize)
                .cornerRadius(50)
            // 影をつける
                .shadow(radius: 10)

            Button (action: {
            }) {
                // ボタンの外見部分
                // ImageにSF Symbolを使っています
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize, alignment: .center)

            } // BottomButton
        } // ZStack
    }
}
