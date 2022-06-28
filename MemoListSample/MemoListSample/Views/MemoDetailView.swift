//
//  MemoDetailView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/21.
//

import SwiftUI

struct MemoDetailView: View {

    // 引数としてMemoLisetViewから要素を受け取る
    @Binding var memo: [String:String]

    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text(memo["memoTitle"]!)
                    .font(.largeTitle)
                    .fontWeight(.thin)
                Spacer()
                Text(memo["memoTime"]!)
                    .opacity(0.5)
            }
            .padding(.bottom, 20)
            Text(memo["memoText"]!)
                .fontWeight(.light)

            Spacer()
        }
        .padding(.horizontal, 20)

    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView(memo: .constant(["memoTitle": "Swift勉強", "memoTime": "17:11", "memoText": "SwiftUIでメモアプリ作成"]))
    }
}

