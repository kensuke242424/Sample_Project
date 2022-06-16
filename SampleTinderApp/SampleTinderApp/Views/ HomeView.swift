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

    // .zero = (x: 0, y: 0)
    @State var translation: CGSize = .zero
    @State var numbers = [0,1,2,3,4,5]

    var body: some View {


        GeometryReader(content: { geometry in

            ForEach(numbers, id: \.self) { number in

                // カードView全体が束ねられている
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

                            Text("NOPE")
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
                // カードを動かすための処理
                // 状態変数として宣言したtranslationプロパティの値が
                // .gestureによって変化することでカードの位置を動かしている
                .offset(self.numbers.last == number ? translation : .zero)
                .rotationEffect(self.numbers.last == number ? .degrees(Double(self.translation.width / 300 * 20)) : .zero)
                .gesture(
                    DragGesture()
                    // ドラッグによる値の変化をvalueに格納している
                        .onChanged({ value in
                            // translasionプロパティの値にvalue内のtranslation値を参照させて状態変数で変化させている
                            self.translation = value.translation
                            // ドラッグによる値の動きが格納されたvalueのlocation(位置情報)をプリント
                            print("value.location: ", value.location)

                        }) // .onChanged
                        .onEnded({ value in
                            if value.startLocation.x - 150 > value.location.x {

                                // 左側にフェードアウト
                                self.translation = .init(width: -800, height: 0)

                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    self.numbers.removeLast()
                                    self.translation = .zero
                                }


                            } else if value.startLocation.x + 150 < value.location.x {

                                // 右側にフェードアウト
                                self.translation = .init(width: 800, height: 0)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    self.numbers.removeLast()
                                    self.translation = .zero
                                }

                            } else {
                                // 元の位置に戻る
                                self.translation = .zero
                            }
                        }) // .onEnded

                ) // .gesture
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1), value: translation)

            }// ForEach


        }) // GeometryReader®
    } // body
} // CardView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

