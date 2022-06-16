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

    var body: some View {

        // 後で調べる
        GeometryReader(content: { geometry in

            // 画像にテキストをうまく重ねるため、ZStackを重ねる必要がある
            ZStack {
                ZStack {

                    Image("neko1")
                        .resizable()
                        .scaledToFill()

                    LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)

                }
                // Imageとグラディエントをまとめてモディファイアでフレーム調整
                .frame(width: geometry.size.width - 20, height: geometry.size.height)
                .cornerRadius(10)
                .padding(.all, 10)
                .shadow(radius: 10)


                VStack {

                    HStack {
                        Text("GOOD")
                            .font(.system(size: 40, weight: .heavy))
                            .foregroundColor(.green)
                            .padding(.all, 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.green, lineWidth: 4)

                            )

                        Spacer()

                        Text("NOTE")
                            .font(.system(size: 40, weight: .heavy))
                            .foregroundColor(.red)
                            .padding(.all, 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.red, lineWidth: 4)
                            )
                    }
                    .padding(.all, 30)

                    Spacer()

                    HStack {
                        //(alignment: .leading)でテキストが左寄りに並ぶ
                        VStack(alignment: .leading) {
                            Text("Daikiti")
                                .foregroundColor(Color.white)
                            // system fontを使うことで数値でフォントデザインを指定可能
                                .font(.system(size: 40, weight: .heavy))

                            Text("大阪")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20, weight: .medium))

                            Text("カツオ")
                                .foregroundColor(Color.white)
                                .font(.system(size: 25, weight: .medium))

                            Text("カツオが大好きです")
                                .foregroundColor(Color.white)
                                .font(.system(size: 25, weight: .medium))
                        }
                        // テキストの位置を変えたければpaddingを指定
                        .padding(.leading, 20)

                        // テキストとボタンの間を空ける
                        Spacer()

                        Button(action: {}, label: {
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                        })
                        .padding(.trailing, 50)

                    }
                    .padding(.bottom, 40)
                }
            }
        }) // GeometryReader
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

