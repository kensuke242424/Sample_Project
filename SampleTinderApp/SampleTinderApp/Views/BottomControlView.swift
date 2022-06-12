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
            Color.white
//                .frame(width: backGroundSize, height: backGroundSize)
//                .cornerRadius(50)
//                .shadow(radius: 10)

                // 作成したカスタムモディファイアを呼び出し
                // 引数は指定したCGFroat型のbackGroundSizeを渡す
                .asRoundShadow(size: backGroundSize)

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


// カスタムモディファイア
struct ButtomButtonModifier: ViewModifier {

    var size: CGFloat

    // content View自体のこと
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .cornerRadius(size)
            .shadow(radius: 10)
    }
}

// ⬆︎で作成したモディファイアをViewに渡せるようにする
extension View {

    func asRoundShadow(size: CGFloat) -> some View {

        modifier(ButtomButtonModifier(size: size))
    }

}
