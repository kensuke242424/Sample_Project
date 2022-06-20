//
//  MemoDetailView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/21.
//

import SwiftUI

struct MemoDetailView: View {

    // 引数としてMemoLisetViewから要素を受け取る
    var memo: [String]

    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text(memo[0])
                    .font(.largeTitle)
                    .fontWeight(.thin)
                Spacer()
                Text(memo[1])
            }
            .padding(.bottom, 20)
            Text(memo[2])

            Spacer()
        }
        .padding(.all, 20)
        .navigationBarTitle(Text("詳細"),
                            displayMode: .inline)

    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView(memo: ["Swift勉強", "15:55", "Swiftでメモアプリを作成する"])
    }
}

