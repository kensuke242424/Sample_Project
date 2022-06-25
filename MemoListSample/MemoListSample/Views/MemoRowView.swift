//
//  MemoRowView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/20.
//

import SwiftUI

struct MemoRowView: View {

    var memo: [String:String]

    var body: some View {

        VStack(alignment: .leading) {

            Text(memo["memoTitle"]!)
                .font(.headline)
                .padding(.horizontal, 20.0)
                .padding(.bottom, 5)
                .lineLimit(1)
            HStack {
                Text(memo["memoTime"]!)
                    .opacity(0.5)
                Spacer()
                Text(memo["memoText"]!)
                    .opacity(0.5)
                // 行の表示数を制限する
                    .lineLimit(1)

            }
            .padding(.horizontal, 20.0)

            Spacer()
        }
    }
}

struct MemoRowView_Previews: PreviewProvider {
    static var previews: some View {
        MemoRowView(memo: ["memoTitle": "Swift勉強", "memoTime": "17:11", "memoText": "SwiftUIでメモアプリ作成"])
    }
}

