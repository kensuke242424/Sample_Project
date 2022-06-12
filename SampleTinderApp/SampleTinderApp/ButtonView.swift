//
//  ButtonView.swift
//  SampleTinderApp
//
//  Created by 中川賢亮 on 2022/06/11.
//

import SwiftUI

// ✅通常のボタンView
struct ButtonView: View {

    // SF Symbolのシンボル名を呼び出し時に渡す
    var imageName: String
    // frameモディファイア内の指定数値を呼び出し時に渡す
    var imageSize: CGFloat

    var body: some View {

        Button (action: {
        }) {
            // Image(systemName: "<シンボル名>") ← これでSFSymbolのアイコンが呼び出せます
            Image(systemName: imageName)
                .resizable()
                .scaledToFill()
                .frame(width: imageSize, height: imageSize, alignment: .center)
        }
    }
}

// ✅丸枠のボタンView
struct CircleButtonView: View {

    var imageName: String
    var imageSize: CGFloat
    // 丸枠のframe数値を呼び出し時に渡す
    var backGroundSize: CGFloat

    var body: some View {

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

// ✅楕円枠のボタンView
struct EllipseButtonView: View {

    var imageName: String
    var imageSize: CGFloat
    // 横長にするため、frameの縦横の数値が異なります
    // widthとheightで別のプロパティを作って、frameにそれぞれ値を渡せるようにしています
    var backGroundWidthSize: CGFloat
    var backGroundHeightSize: CGFloat

    var body: some View {

        ZStack {

            // 楕円形枠の作成
            // ZStackで囲み、重ねる
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white)
                // 縦と横の値をそれぞれ別の値で指定できるように
                .frame(width: backGroundWidthSize, height: backGroundHeightSize)
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

