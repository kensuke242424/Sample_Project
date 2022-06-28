//
//  MemoDetailView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/21.
//

import SwiftUI

struct MemoDetailView: View {

    // 引数としてViewModelのMemoDataを受け取る
    @StateObject var vm: MemoData
    // 選択されたメモリストのindexナンバーを受け取る
    let indexNumber: Int
    // ここで編集された値が完了ボタンを押すことで新しくメモタイトルとして更新される
    @State private var edditMemoTitle = ""
    // ここで編集された値が完了ボタンを押すことで新しくメモテキストとして更新される
    @State private var edditMemoText = ""
    // Home画面に戻るためのプロパティ
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                TextField("タイトル", text: $edditMemoTitle)
                    .font(.largeTitle)

                Spacer()

                Text(vm.memos[indexNumber]["memoTime"]!)
                    .opacity(0.5)
            }
            .padding(.bottom, 20)
             // メモ詳細を記入するテキストボックス
            TextEditor(text: $edditMemoText)
                .padding(.horizontal)

            Spacer()

        }
        .padding(.horizontal, 20)
        .navigationBarTitle(Text("メモ編集画面"),
                            displayMode: .inline)
        .navigationBarItems(trailing: Button("完了") {

            // 完了ボタンを押すことでmemoの値を更新する
            vm.memos[indexNumber]["memoTitle"]! = edditMemoTitle
            vm.memos[indexNumber]["memoText"]! = edditMemoText

            self.presentationMode.wrappedValue.dismiss()

        }.padding())

    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView(vm: MemoData(),indexNumber: 1)
    }
}

