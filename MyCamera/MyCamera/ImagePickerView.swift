//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by 中川賢亮 on 2022/04/15.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    
   // @Binding ⇨ @Stateからの情報を連動させることができる。双方向にデータ連動
    @Binding var isShowSheet: Bool
    
    // UIImage　⇨ 撮影した画像を画面に表示させるクラス
    @Binding var captureImage: UIImage?
    
    
    // コーディネーターでコントローラのDelegateを管理
    // NSObject, UINavigationControllerDelegate は、UIImagePickerControllerを使うために必要である
    
    class Coordinator: NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
        
        let parent: ImagePickerView
        init(_ parent: ImagePickerView) {
            
            self.parent = parent
            
        }
        
        
        // 写真が撮影されたときに呼び出される処理。必ず必要
        // 第一引数 picker:UIImagePickerController ⇨ 親元である構造体「ImagePickerView」を呼び出している
        // 第二引数 didFinishPickingMediaWithInfo(←ラベル) info: [UIImagePickerController.InfoKey(Dictionaryのキー) : Any（Dictionaryの型）
        // Dictionaryって？　Dictionary:辞書の意味　宣言は、　変数名: [(キーのデータ型 : 値のデータ型)] 　　例⇨　let dictionary1: [("key1": 1, "key2": 2)]   ⇨   print(dictionary[key1]!) // 1
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            
            //　撮影時に取得したinfo内のさまざまなデータ（Any）から、.originalImageメソッドで写真データのみを取り出し、 as? を使ってUIImage型に型変換（キャスト）している
            // if let なので、以下の型変換が成功した場合にクロージャ内の処理が実行される
            if let originalImage =
                
                info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }
            
            // Sheet閉じない
            parent.isShowSheet = true
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isShowSheet = false
        }
        
    } // class Coordinator ここまで
    
    
    // Coordinatorを作成、SwiftUIによって自動的に呼び出し
    func makeCoordinator() -> Coordinator {
       return Coordinator(self)             // Coorinator自体をインスタンス化し、親元のstruct ImagePickerViewをselfで引数として指定して返している
    }
    
    
    // 表示するViewを作成するときに必要な処理　UIVIewControllerRepresentableを使用する際に必ず必要
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) ->  UIImagePickerController {
        
        // 撮影画面の起動に必要なUIImagePickerControllerをインスタンス化して格納
        let myImagePickerController = UIImagePickerController()
        
        // UIImagePickerControllerの.sourceTypeに.cameraを格納。カメラ撮影モードが呼び出される
        myImagePickerController.sourceType = .camera
        
        
        
        //context.coodinator ⇨ 第一引数contextの内部に入っている、class Coordinatorのdelegate処理imagePickerController,imagePickerControllerDidCancelを明示している
        myImagePickerController.delegate = context.coordinator
        
        // 上記の処理がされたmyImagePickerControllerをUIImagePickerControllerに戻り値として格納
        return myImagePickerController
    }
    
    // 表示されているViewが更新されるときに呼び出される。今回は使わないが、必ず記述する
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        // 処理なし
    }
    
}
