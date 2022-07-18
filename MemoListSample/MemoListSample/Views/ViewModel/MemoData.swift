//
//  MemoModel.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/24.
//

import SwiftUI

class MemoData: ObservableObject {

    // 辞書型配列
    @Published var memos = [["memoTitle": " タイトル", "memoTime": "xx月oo日", "memoText": "ここにメモ詳細が記録されます"]]

}
