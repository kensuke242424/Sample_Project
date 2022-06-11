//
//  SafariView.swift
//  MyOkashiApp
//
//  Created by 中川賢亮 on 2022/05/18.
//

import SwiftUI
// アプリ内部でsafariを起動できるフレームワーク(WebView)
// SFSafariViewControllerを使ってsafariを立ち上げるが、その機能がまだSwiftUIに備わっていないため、UIViewControllerRepresentableでラップして使う
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    var url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //　処理なし
    }
}
