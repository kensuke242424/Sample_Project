//
//  PHPickerView.swift
//  MyCamera
//
//  Created by 中川賢亮 on 2022/04/18.
//

import SwiftUI
import PhotosUI

struct PHPickerView: UIViewControllerRepresentable {
    
    @Binding var isShowSheet : Bool
    
    @Binding var captureImage : UIImage?
    
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        var parent: PHPickerView
        
        // struct PHPickerViewを引数で引っ張ってきて、class Coordinatorに持ってきている
        init(parent: PHPickerView) {
            self.parent = parent
        }
        
        
        //フォトライブラリー画面で写真を選択・キャンセルしたときに実行される
        // delegateメソッドが必ず必要
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) { // didFinishPickingはラベル
            
            if let result = results.first {
                
                // 中身があることを確認し、その中から.firstを選択したデータを非同期で取得する
                result.itemProvider.loadObject(ofClass: UIImage.self) {
                    (image,error) in
                    
                    // as? 型変換、キャストしている
                    // 写真が取得できたら動く処理
                    if let unwrapImage = image as? UIImage {
                        
                        self.parent.captureImage = unwrapImage
                        
                    } else {
                        print("使用できる写真がないです")   // if let unwrapImage = image as? UIImage の条件文に対して
                    }
                }
                
                parent.isShowSheet = true
                
            } else {
                print("選択された写真はないです")   // if let result = results.first　の条件文に対して
                
                parent.isShowSheet = false
                
            }
            // sheet画面は閉じない
            parent.isShowSheet = true
        }
        
    } // Coodinator ここまで
    
    
    
    // Coordinatorを作成、SwiftUIによって自動的に呼び出し
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    // Viewを作成するときに実行
    func makeUIViewController(context: UIViewControllerRepresentableContext<PHPickerView>) -> PHPickerViewController {
        
        // PHPickerViewControllerのカスタマイズ
        var configuration = PHPickerConfiguration()
        
        // PHPickerViewControllerの表示を静止画（写真）に限定する
        configuration.filter = .images
        
        // 選択できる写真の枚数を指定する　「0」の場合無制限になる
        configuration.selectionLimit = 1
        
        // configurationの設定がされたPHPickerViewControllerをpickerに格納する
        let picker = PHPickerViewController(configuration: configuration)
        
        // pickerのデリゲートを指定する　class coordinator内のpicker関数が指定したいデリゲート
        picker.delegate = context.coordinator
        
        // 設定情報が格納されたpickerを返す
        return picker
        
    }
    
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PHPickerView>) {
        // 処理なし
    }
    
}

