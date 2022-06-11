//
//  EffectView.swift
//  MyCamera
//
//  Created by 中川賢亮 on 2022/05/10.
//

import SwiftUI

// フィルター各種を列挙し配列で格納(Array)
// フィルター名が間違っていると、エラー表示されない上にエフェクトが反映されないため注意
//0. モノクロ
//1. Chrome
//2. Fade
//3. Instant
//4. Noir
//5. Process
//6. Tonal
//7. Transfer
//8. SepiaTone

let filterArray = ["CIPhotoEffectMono","CIPhotoEffectChrome","CIPhotoEffectFade","CIPhotoEffectInstant","CIPhotoEffectNoir","CIPhotoEffectProcess","CIPhotoEffectTonal","CIPhotoEffectTransfer","CISepiaTone"
]

// 洗濯中のエフェクト（filterArray）の添字
var filterSelectNumber = 0

struct EffectView: View {
    
    // エフェクト編集画面の表示有無を管理する状態変数
    @Binding var isShowSheet: Bool
    
    // 撮影した写真を格納する定数　エフェクト編集されたデータは別の場所に保存されるため、元のデータは変化しないため定数
    let captureImage: UIImage
    
    // 画面に表示する写真　エフェクト編集後のデータがここに格納される
    @State var showImage: UIImage?
    
    // 表示有無を管理する状態変数
    @State var isShowActivity = false
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            if let unwrapShowImage = showImage {
                
                Image(uiImage: unwrapShowImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
            
            Button("エフェクト") {
                
                // ボタンアクション処理
                
                // 画像加工処理までの流れを頭に入れる！
                
                
                let filterName = filterArray[filterSelectNumber]
                
                filterSelectNumber += 1
                
                // filterArray.count ⇨ 配列内の限数をとることができる　この場合０〜８の９種類あるため「９」
                // エフェクトボタンを押すたびに１ずつカウントを足していき、８になった時点で0に戻る処理
                if filterSelectNumber == filterArray.count {
                    
                    // フィルタを最初に戻す
                    filterSelectNumber = 0
                    
                }
            
                // 元々の画像の回転角度を取得
                let rotate = captureImage.imageOrientation
                // UIImage型の画像をCIImage型に変換
                let inputImage = CIImage(image: captureImage)
                // guard let でnilではないかの確認　effectfilterがnilだった場合処理を終了
                // 指定したフィルターのインスタンスを取得
                guard let effectFilter = CIFilter(name: filterName) else {return}
                // フィルタ加工のパラメータを初期化
                effectFilter.setDefaults()
                // インスタンスにフィルタ加工する元の画像を指定
                effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
                // フィルタ加工を行う情報を生成
                guard let outputImage = effectFilter.outputImage else {return}
                // CIContextのインスタンスを取得
                let ciContext = CIContext(options: nil)
               // createCGImageメソッドを使用して結果をcgImageとしてCGImage形式の画像を取得
                guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {return}
                // フィルタ加工後の写真をCgImageからUIImageに変換。その際回転角度を指定
                // lesson3-2 20:00解説
                showImage = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .background(Color.blue)
            .foregroundColor(Color.white)
            
            
//            .padding()
            
            
            Button("シェア") {
                
                // UIActivityController(シェア画面)をモーダル表示する
                isShowActivity = true
                 
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .background(Color.blue)
            .foregroundColor(Color.white)
            // $ データバインド（連動）
            .sheet(isPresented: $isShowActivity) {
                // シェア画面表示
                // .resize()は、UIImageExtensionファイルで作成した画像リサイズ処理を呼び出している
                ActivityView(shareItems: [showImage!.resize()!])
            }
            
//            .padding()
            
            // エフェクト編集画面を閉じる
            Button("閉じる") {
                isShowSheet = false
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .background(Color.blue.edgesIgnoringSafeArea(.top))
            .foregroundColor(Color.white)
            
//            .padding()
            
            
        } // VStack ここまで
        
        // 写真が表示される時に実行される　VStack下にモディファイアとして記述
        .onAppear {
            
            // 撮影した写真を表示する写真に設定
        showImage = captureImage
        }
        
    }
}
    struct EffectView_Previews: PreviewProvider {
        static var previews: some View {
            EffectView(
                
                // プレビューで表示するにはisShowSheetの初期値を設定する必要あり
                // 以下のようにして記述すると表示される
                isShowSheet: Binding.constant(true),
                // captureImageもプレビュー確認時は初期値の設定必要あり
                captureImage: UIImage(named: "preview_use")!)
        }
    }
