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
                .padding(.bottom, 10)

            // 下部ボタン呼び出し
            BottomControlView()


        } // VStack
    } // body
} // View

// 人物カードのデザインView
struct CardView: View {

    // 画面の横幅をiPhoneのフレームラインに合わせる
    private var frameWidth: CGFloat {UIScreen.main.bounds.width}

    var body: some View {

        // 後で調べる
        GeometryReader(content: { geometry in

            // 画像にテキストをうまく重ねるため、ZStackを重ねる必要がある
            ZStack {
                ZStack {

                    Image("man1")
                        .resizable()
                        .scaledToFill()

                    LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)

                }

                // Imageとグラディエントをまとめてモディファイアでフレーム調整
                .frame(width: geometry.size.width - 20, height: geometry.size.height)
                .cornerRadius(10)
                .padding(.all, 10)
                .shadow(radius: 10)

                Text("Taro")
                    .foregroundColor(Color.white)
                // system fontを使うことで数値でフォントデザインを指定可能
                    .font(.system(size: 25, weight: .heavy))
            }
        }) // GeometryReader



    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

