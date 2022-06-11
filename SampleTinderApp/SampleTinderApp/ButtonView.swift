//
//  ButtonView.swift
//  SampleTinderApp
//
//  Created by 中川賢亮 on 2022/06/11.
//

import SwiftUI

// ✅通常のボタンView
struct ButtonView: View {

    var imageName: String
    var imageSize: CGFloat

    var body: some View {

        Button (action: {
        }) {
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
    var backGroundSize: CGFloat

    var body: some View {

        ZStack {

            Color.white.frame(width: backGroundSize, height: backGroundSize)
                .cornerRadius(50)
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
struct EllipseButtonStyleView: View {

    var imageName: String
    var imageSize: CGFloat
    var backGroundWidthSize: CGFloat
    var backGroundHeightSize: CGFloat

    var body: some View {

        ZStack {

            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white)
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

