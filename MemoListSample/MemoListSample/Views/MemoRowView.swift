//
//  MemoRowView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/20.
//

import SwiftUI

struct MemoRowView: View {

    var memo: [String]

    var body: some View {

        HStack {
            Text(memo[0])
            Spacer()
            Text(memo[1])
        }
        .padding(.horizontal, 20.0)

    }
}

struct MemoRowView_Previews: PreviewProvider {
    static var previews: some View {
        MemoRowView(memo: ["Swift勉強", "15:55", "Swiftでメモアプリを作成する"])
    }
}

