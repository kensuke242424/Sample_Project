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

    // Home画面に戻るためのプロパティ
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text(vm.memos[indexNumber]["memoTitle"]!)
                    .font(.title)
                    .padding(.horizontal)

                Spacer()

                Text(vm.memos[indexNumber]["memoTime"]!)
                    .opacity(0.5)
            }
            .padding(.bottom, 20)
             // メモ詳細を記入するテキストボックス
            Text(vm.memos[indexNumber]["memoText"]!)
                .padding(.horizontal)

            Spacer()

        }
        .padding(.horizontal, 20)
        .navigationBarItems(trailing: Button("完了") {

            self.presentationMode.wrappedValue.dismiss()

        }.padding())

    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView(vm: MemoData(),indexNumber: 0)
    }
}

