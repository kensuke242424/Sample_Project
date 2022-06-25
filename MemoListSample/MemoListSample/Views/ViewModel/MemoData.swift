//
//  MemoModel.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/24.
//

import SwiftUI

class MemoData: ObservableObject {

    // 辞書型配列
    @Published var memos = [["memoTitle": "プログラミングで起きたエラー", "memoTime": "10:01", "memoText": "Cannot find 'memos' in scope"],
                            ["memoTitle": "Swift勉強", "memoTime": "17:11", "memoText": "SwiftUIでメモアプリ作成"],
                            ["memoTitle": "誕生日プレゼント",  "memoTime": "16:34", "memoText": "どこそこデパートにプレゼントを買いに行く"]]

}
