//
//  ContentView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/20.
//

import SwiftUI

struct MemoListView: View {

    // MemoModelのデータを呼び出し
    @StateObject var vm: MemoData
    // 新規メモViewへの遷移フラグを管理
    @State private var isActive = false
    // 新規メモ作成ボタンをタップするとこのプロパティ内の空メモ要素が配列memosの[0]にインサートされる
    var newMemo = ["memoTitle": "", "memoTime": "", "memoText": ""]

    var body: some View {

        NavigationView {
            VStack {

                List {
                    ForEach(0 ..< vm.memos.count, id: \.self) { index in

                        NavigationLink(destination: MemoDetailView(vm: vm, indexNumber: index)) {
                            MemoRowView(memo: vm.memos[index])
                        }
                    }
                    // 削除機能
                    .onDelete(perform: delete)
                    // 編集機能(並び替え)
                    .onMove(perform: move)

                }
                .navigationBarItems(trailing: EditButton())
                .navigationTitle(Text("メモ"))

                // 新規メモViewへの画面遷移に使用
                // 下部のボタンとisActiveプロパティで紐づけている
                NavigationLink(destination: NewMemoView(vm: vm), isActive: $isActive) {
                    EmptyView()
                }

                // 新規メモView遷移ボタン
                Button(action: {

                    // 新規メモデータをメモデータ配列のindex[0](最前列)へ格納
                    vm.memos.insert(newMemo, at: 0)
                    isActive.toggle()
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.top)
                }
            } // VStack
//             メモリスト表示時に、タイトルと詳細が空の新規メモが存在していた場合、自動で削除
            .onAppear() {
                if vm.memos[0]["memoTitle"] == "" && vm.memos[0]["memoText"] == "" {
                    print("メモが空白だったので削除しました")
                    vm.memos.remove(at: 0)
                }
            }

        } // NavigationView
    } // body

    // デリートメソッド
    func delete(offsets: IndexSet) {
        vm.memos.remove(atOffsets: offsets)
    }

    // 編集メソッド
    func move(offsets: IndexSet, index: Int) {
        vm.memos.move(fromOffsets: offsets, toOffset: index)
    }

} // View

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView(vm: MemoData())
    }
}
