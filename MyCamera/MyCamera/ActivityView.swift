//
//  ActivityView.swift
//  MyCamera
//
//  Created by 中川賢亮 on 2022/04/16.
//

import SwiftUI // この中にUIKitも含まれている

struct ActivityView: UIViewControllerRepresentable {   // Share画面用の処理
    
    let shareItems: [Any]
    
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        return controller
        
    }
    
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {
        // 処理なし　
    }
    
}

