//
//  NewMemoView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/23.
//

import SwiftUI

struct NewMemoView: View {

    // フォーカスが当たるTextFieldを判断するためのenum
    enum Field: Hashable { case title }

    @FocusState private var foucsedField: Field?
    @State var newMemoTitle = ""
    @State var newMemoText = ""

    @State private var isEditting = false
    // Home画面に戻るためのプロパティ
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var vm: MemoData



    var body: some View {

        VStack {
            TextField("タイトル", text: $newMemoTitle)
                .padding(20)
                .frame(width: 400, height: 50)
                .font(.title)
                .focused($foucsedField, equals: .title)


            TextEditor(text: $newMemoText)
            //                .ignoresSafeArea()
                .padding(.horizontal)

        } // VStack
        .navigationBarTitle(Text(""),
                            displayMode: .inline)
        .navigationBarItems(trailing: Button("完了") {

            vm.memos[0]["memoTitle"] = newMemoTitle
            vm.memos[0]["memoTime"] =
            "\(Int.random(in: 0...1))\(Int.random(in: 0...9)) : \(Int.random(in: 0...5))\(Int.random(in: 0...9))"
            vm.memos[0]["memoText"] = newMemoText

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
        NewMemoView()
    }
}
