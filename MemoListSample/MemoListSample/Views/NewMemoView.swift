//
//  NewMemoView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/23.
//

import SwiftUI

struct NewMemoView: View {

    // フォーカスが当たるTextFieldを判断するためのenum
    enum Field { case title }

    @FocusState private var foucsedField: Field?
    // 現在時刻を出力するためのDateインスタンス
    private let date = Date()
    private let dateFormatter =  DateFormatter()
    @State private var newMemoTitle = ""
    @State private var newMemoText = ""
    @State private var newMemoTime = ""
    @StateObject var vm: MemoData

    // Home画面に戻るためのプロパティ
    @Environment(\.presentationMode) private var presentationMode


    var body: some View {

        VStack {
            // メモのタイトルを記入するテキストボックス
            TextField("タイトル", text: $newMemoTitle)
                .padding(20)
                .frame(width: 400, height: 50)
                .font(.title)
                .focused($foucsedField, equals: .title)

            // メモ詳細を記入するテキストボックス
            TextEditor(text: $newMemoText)
                .padding(.horizontal)

        } // VStack
        .navigationBarTitle(Text(""),
                            displayMode: .inline)
        .navigationBarItems(trailing: Button("完了") {

                // 現在時刻を生成して新規メモのmemoTextに格納
                dateFormatter.dateFormat = "MM月dd日"
                newMemoTime = dateFormatter.string(from: date)

            vm.memos[0]["memoTitle"] = newMemoTitle
            vm.memos[0]["memoText"] = newMemoText
            vm.memos[0]["memoTime"] = newMemoTime

            self.presentationMode.wrappedValue.dismiss()

        }.padding())

        // .onApperはView表示時に発生する処理のこと
        // NewMemoViewへの遷移から、0.5秒ずらしてenumの値を更新し、キーボード表示の処理を行う
        .onAppear() {

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                foucsedField = .title
            }
        }

    } // body
} // View

struct NewMemoView_Previews: PreviewProvider {
    static var previews: some View {
        NewMemoView(vm: MemoData())
    }
}
