//
//  ContentView.swift
//  TrashDayApp
//
//  Created by 中川賢亮 on 2022/06/01.
//

import SwiftUI

struct ContentView: View {

    // ピッカーの要素 各曜日を格納
    let week = ["曜日を選択", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日"]

    @State private var selection = 0
    @State private var trashImage = ""
    @State private var text = ""

    var body: some View {

        ZStack {

            LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {

                Text("ゴミ分別チェッカー")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                Text("今日は何曜日ですか？")
                    .fontWeight(.thin)
                    .padding(.top)

                // 曜日選択ピッカー
                Picker(selection: $selection, label: Text("")) {

                    ForEach(0 ..< week.count) { num in
                        Text(self.week[num])
                    }
                }
                .onChange(of: selection) { newValue in
                    print("\(newValue)が選択されました")
                }

                //            .pickerStyle(WheelPickerStyle())
                .frame(width: 50, height: 50)

                Spacer()

                switch selection {

                case 1, 4:
                    TrashImageView(trashImage: "dailyTrash")
                    Spacer()
                    TrashTextView(text: "今日は生活ゴミの日！")

                case 3:
                    TrashImageView(trashImage: "can,bottle")
                    Spacer()
                    TrashTextView(text: "1.3週は缶ビン、2.4週はペットボトル！")

                case 6:
                    TrashImageView(trashImage: "gomi_plastic")
                    Spacer()
                    TrashTextView(text: "今日はプラスチックの日！")
                case 2, 5, 7:
                    TrashImageView(trashImage: "peke")
                    Spacer()
                    TrashTextView(text: "今日はゴミの日ではありません！")
                default:
                    TrashImageView(trashImage: "home")
                    Spacer()
                    TrashTextView(text: "地球を綺麗に！")
                }

                Spacer()

            }// VStack
        }// ZStack
    } // body
} // View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
