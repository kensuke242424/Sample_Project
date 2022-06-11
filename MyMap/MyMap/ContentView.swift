//
//  ContentView.swift
//  MyMap
//
//  Created by 中川賢亮 on 2022/04/08.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var inputText:String = ""
    @State var dispSearchKey:String = ""
    @State var dispMapTipe:MKMapType = .standard
    
    var body: some View {
        
        VStack {
            
            TextField("キーワードを入力してください",
                      
                      // onCommit → 検索完了後に発動される処理
                      // $ ⇨ 中身の情報を渡す方と受け取る方の両方で変化させる。
                      // $をつけない場合は、受ける方が一方的に変化を受け取る。
                      // git更新用に今書いています
                      text:$inputText,onCommit: {
                
                dispSearchKey = inputText
                print("入力したキーワード:" + dispSearchKey)
            })
            
            .padding()
            
            ZStack(alignment: .bottomTrailing) {
            
            MapView(searchKey: dispSearchKey,mapType: dispMapTipe)
                
                Button(action: {
                    
                    if dispMapTipe == .standard {
                        dispMapTipe = .satellite
                    } else if dispMapTipe == .satellite {
                        dispMapTipe = .hybrid
                    } else if dispMapTipe == .hybrid {
                        dispMapTipe = .satelliteFlyover
                    } else if dispMapTipe == .satelliteFlyover {
                       dispMapTipe = .hybridFlyover
                   } else if dispMapTipe == .hybridFlyover {
                       dispMapTipe = .mutedStandard
                   } else {
                       dispMapTipe = .standard
                   }

                }) {
                    
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0, alignment: .leading)
                    
                }
                // 地図ボタンの位置調整
                // 右の余白２０空ける
                .padding(.trailing,20.0)
                // 下の余白３０空ける
                .padding(.bottom,30.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー",mapType: .standard)
    }
}
