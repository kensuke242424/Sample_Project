//
//  MemoModel.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/24.
//

import SwiftUI

class MemoModel: ObservableObject {

//    @Published var memoTitle = ""
//    @Published var memoTime = ""
//    @Published var memoText =
//"""
//"""
    // 辞書型配列
    @Published var memos = [["memoTitle": "にんじん", "memoTime": "10:01", "memoText": "にんじんの美味しい料理の仕方を調べる。"],
                            ["memoTitle": "Swift勉強", "memoTime": "17:11", "memoText": "SwiftUIでメモアプリ作成"],
                            ["memoTitle": "誕生日",  "memoTime": "16:34", "memoText": "プレゼントを買いに行く"]]

    init() {
    }

}
