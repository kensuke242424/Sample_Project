//
//  MemoDetailView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/21.
//

import SwiftUI

struct MemoDetailView: View {

    // 引数としてMemoLisetViewから要素を受け取る
    var memo: [String:String]

    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text(memo["title"]!)
                    .font(.largeTitle)
                    .fontWeight(.thin)
                Spacer()
                Text(memo["nowTime"]!)
            }
            .padding(.bottom, 20)
            Text(memo["memoText"]!)

            Spacer()
        }
        .padding(.all, 20)
        .navigationBarTitle(Text("詳細"),
                            displayMode: .inline)

    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView(memo: ["title": "Swift勉強", "nowTime": "17:11", "memoText": "SwiftUIでメモアプリ作成"])
    }
}

