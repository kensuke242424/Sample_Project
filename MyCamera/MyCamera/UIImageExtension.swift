//
//  UIImageExtension.swift
//  MyCamera
//
//  Created by 中川賢亮 on 2022/05/10.
//

import Foundation
import UIKit

// extension ⇨ 拡張の意味　新たに機能を追加するイメージ
// 撮影した写真をSNS投稿などで使えるようリサイズする処理
extension UIImage {
    
    func resize() -> UIImage? {
        
        let rate = 1024.0 / self.size.width
        let rect = CGRect(x:0, y:0, width: self.size.width * rate,height: self.size.height * rate)
        
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
        
    }
    
}
