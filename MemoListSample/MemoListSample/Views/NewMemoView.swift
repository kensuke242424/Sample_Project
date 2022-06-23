//
//  NewMemoView.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/23.
//

import SwiftUI

struct NewMemoView: View {

    @State private var newMemoTitle = ""
    @State private var newMemoText =
"""
"""
    @State private var isEditting = false
    // Home画面に戻るためのプロパティ
    @Environment(\.presentationMode) var presentation

    var body: some View {

        VStack {
            TextField("タイトル", text: $newMemoTitle, onEditingChanged: { begin in

                if begin {
                    isEditting.toggle()
                }
            })
            .padding(20)
            .frame(width: 400, height: 50)
            .font(.title)
            .border(.gray)

            TextEditor(text: $newMemoText)
                .ignoresSafeArea()
                .padding(.horizontal)

        }
        .navigationBarTitle(Text("新規メモ"),
                            displayMode: .inline)

    }
}

struct NewMemoView_Previews: PreviewProvider {
    static var previews: some View {
        NewMemoView()
    }
}
