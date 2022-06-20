//
//  ContentView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/20.
//

import SwiftUI

struct MemoListView: View {

    @State var memos = ["a", "i", "u"]

    var body: some View {

        List {
            ForEach(memos, id: \.self) { memo in

                Text(memo)
                    .padding()

            }
        }
    }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
