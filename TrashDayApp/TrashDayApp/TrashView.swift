//
//  TrashView.swift
//  TrashDayApp
//
//  Created by 中川賢亮 on 2022/06/01.
//

import SwiftUI

struct TrashImageView: View {

    let trashImage: String

    var body: some View {

        Image("\(trashImage)")
            .resizable()
            .aspectRatio(contentMode: .fit)

    }
}

struct TrashTextView: View {

    let text: String

    var body: some View {

        Text(text)
            .font(.title)
            .fontWeight(.heavy)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .frame(width: 350)

    }
}
