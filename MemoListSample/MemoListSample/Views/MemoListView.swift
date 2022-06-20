//
//  ContentView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/20.
//

import SwiftUI

struct MemoListView: View {

    // 二次元配列
    @State private var memos = [["title1", "10:01", "これはサンプルです。"],
                                ["title2", "17:11", "メモを残します。"],
                                ["title3", "16:34", "課題を終わらせる。"]]

    var body: some View {

        NavigationView {
            List {
                ForEach(memos, id: \.self) { memo in

                    MemoRowView(memo: memo)
                        .padding()

                }
                .onDelete(perform: delete)
                .onMove(perform: move)

            }
            .navigationBarItems(trailing: EditButton())
            .navigationTitle(Text("Memos"))
        }
    } // body

    // デリートメソッド
    func delete(offsets: IndexSet) {
        memos.remove(atOffsets: offsets)
    }

    func move(offsets: IndexSet, index: Int) {
        memos.move(fromOffsets: offsets, toOffset: index)
    }

} // View

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
