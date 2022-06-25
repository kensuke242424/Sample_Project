//
//  MemoListSampleApp.swift
//  MemoListSample
//
//  Created by 中川賢亮 on 2022/06/20.
//

import SwiftUI

@main
struct MemoListSampleApp: App {
    var body: some Scene {
        WindowGroup {
            MemoListView()
                .environmentObject(MemoModel())
        }
    }
}
