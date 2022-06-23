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

    var body: some View {

        VStack {
            TextField("タイトル", text: $newMemoTitle, onEditingChanged: { begin in

                if begin {
                    isEditting.toggle()
                }
            })
            .padding(20)
            .frame(width: 400, height: 50, alignment: .topLeading)
            .font(.title)
            // NavigationViewのバーを隠す
            .navigationBarHidden(true)
            //        .textFieldStyle(RoundedBorderTextFieldStyle())
            //        .shadow(color: isEditting ? .blue : .clear, radius: 3)

            TextEditor(text: $newMemoText)
            //                .border(Color.gray, width: 0.3)
                .ignoresSafeArea()
                .padding(.horizontal)

        }
    }
}

struct NewMemoView_Previews: PreviewProvider {
    static var previews: some View {
        NewMemoView()
    }
}
