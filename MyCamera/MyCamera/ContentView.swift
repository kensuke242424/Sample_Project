//
//  ContentView.swift
//  MyCamera
//
//  Created by 中川賢亮 on 2022/04/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var captureImage: UIImage? = nil
    // カメラ画面を呼び出す
    @State var isShowSheet = false
    
    // フォトライブラリーかカメラかを保持する状態変数
    @State var isPhotolibrary = false
    // actionSheetモディファイアでの表示有無を管理する状態変数
    @State var isShowAction = false
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Button("カメラを起動する") {
                
                // 撮影写真を初期化する
                captureImage = nil
                
                
                // ボタンタップ時のアクション
                isShowAction = true
                
            }
            
            
            
            .frame(maxWidth: .infinity, minHeight: 44.0)
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .background(Color.blue.edgesIgnoringSafeArea(.top))
            .foregroundColor(Color.white)
            .padding()  // 四隅に余白を作る
            
            // ボタンタップ時に評価され、
            .sheet(isPresented: $isShowSheet) {
                
                // captureImageがnilでなかった場合
                if let unwrapCaptureImage = captureImage {
                    
                    //
                    EffectView(isShowSheet: $isShowSheet, captureImage: unwrapCaptureImage)
                    
                } else {
                    
                    // ↓のactionSheet分岐　trueでフォトライブラリー、falseでカメラ
                    if isPhotolibrary {
                        PHPickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                        
                    } else {
                        ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                    }
                    
                }
            }
            // 状態変数:$isActionSheetに変化があったら実行
            .actionSheet(isPresented: $isShowAction) {
                
                ActionSheet(title: Text("確認"),
                            message: Text("選択してください"),
                            buttons: [
                                
                                // カメラを選択
                                .default(Text("カメラ"),action: {
                                    isPhotolibrary = false
                                    
                                    // カメラが利用できるかどうかの判定
                                    if
                                        UIImagePickerController.isSourceTypeAvailable(.camera) {
                                        print("カメラは利用できます")
                                        
                                        isShowSheet = true
                                        
                                    } else {
                                        print("カメラは利用できません")
                                    }
                                    
                                }),
                                // フォトライブラリーを選択
                                .default(Text("フォトライブラリー"),action: {
                                    isPhotolibrary = true
                                    isShowSheet = true
                                }),
                                .cancel(),
                            ])
                
            }
            
            
            
            
            
            
            
        }
        
        
    } // VStack
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
