//
//  ContentView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/20.
//

import SwiftUI

struct MemoListView: View {

    // 二次元配列
    @State private var memos = [["にんじん", "10:01", "にんじんの美味しい料理の仕方を調べる。"],
                                ["Swift勉強", "17:11", "SwiftUIでメモアプリ作成"],
                                ["誕生日", "16:34", "プレゼントを買いに行く"]]
    @State private var newMemo = ""
    @State private var isEditting = false

    var body: some View {

        NavigationView {
            VStack {

                TextField("予定を追加", text: $newMemo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                List {
                    ForEach(memos, id: \.self) { memo in

                        NavigationLink(destination: MemoDetailView(memo: memo)) {
                            MemoRowView(memo: memo)
                        }
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)

                }
                .navigationBarItems(trailing: EditButton())
                .navigationTitle(Text("Memos"))
            }
            }


    } // body

    // デリートメソッド
    func delete(offsets: IndexSet) {
        memos.remove(atOffsets: offsets)
    }

    // 編集メソッド
    func move(offsets: IndexSet, index: Int) {
        memos.move(fromOffsets: offsets, toOffset: index)
    }

} // View

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
