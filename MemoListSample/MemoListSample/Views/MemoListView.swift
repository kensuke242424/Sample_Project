//
//  ContentView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/20.
//

import SwiftUI

struct MemoListView: View {

    // 辞書型配列
    @State private var memos = [["title": "にんじん", "nowTime": "10:01", "memoText": "にんじんの美味しい料理の仕方を調べる。"],
                                ["title": "Swift勉強", "nowTime": "17:11", "memoText": "SwiftUIでメモアプリ作成"],
                                ["title": "誕生日",  "nowTime": "16:34", "memoText": "プレゼントを買いに行く"]]

    @State private var isDisable = false

    var body: some View {

        NavigationView {
            VStack {

                List {
                    ForEach(0 ..< memos.count, id: \.self) { index in

                        NavigationLink(destination: MemoDetailView(memo: memos[index])) {
                            MemoRowView(memo: memos[index])
                        }
                    }
                    // 削除機能
                    .onDelete(perform: delete)
                    //
                    .onMove(perform: move)

                }
                .navigationBarItems(trailing: EditButton())
                .navigationTitle(Text("メモ"))
                

                NavigationLink(destination: NewMemoView()) {

                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                
                }
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
