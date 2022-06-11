//
//  MapView.swift
//  MyMap
//
//  Created by 中川賢亮 on 2022/04/08.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable{
    
    let searchKey: String
    let mapType: MKMapType
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        uiView.mapType = mapType
        
        // CLGeocorder ⇨ 緯度・経度から住所を検索することができる。また、その逆も可能
        // アップルのサーバーから情報を取り寄せている
        let geocoder = CLGeocoder()
        
        // geocorderAddressStringメソッドで、検索されたキーワード第一引数searchKeyからアドレス情報を取得する
        // completionHandler ⇨ 位置情報が取得できた際にplacemarksに自動的にセットされ、情報を取得できなかった場合errorに格納。どちらの場合も以下のクロージャ内の処理は実行される。
        geocoder.geocodeAddressString(searchKey, completionHandler: {(placemarks,error) in
            
            
            // キーワードから取得した複数の場所の位置情報が入ったplacemarksをunwrapPlacemarksに格納
            // if let ~  右記のコードが成立した場合、下の処理へと続いていく　右辺の値が取得できた場合、左辺に格納して次の処理へ...といった流れ
            // なぜif letを使うのか　⇨ placemarks内の値がnilとなる場合があるから。値が入っているかどうかを判断するために、if let を用いている。
            
            if let unwrapPlacemarks = placemarks,  // 「,」で続けていくことで複数のif let 処理が可能
               
                // .firstメソッドを用いて、unwrapPlacemarks内に格納されている複数の検索結果から一番先頭のアドレスをfirstPlacemarksに格納
               let firstPlacemark = unwrapPlacemarks.first,
               
                // .locationメソッド　⇨ 様々な位置情報が格納されている中から、緯度経度を取り出す。
               let location = firstPlacemark.location {
                
                // ↑のif let群が成立した時、下のクロージャ内の処理が実行される
                
                // .cordinateメソッドで緯度経度情報をtargetCordinateに格納
                let targetCordinate = location.coordinate
                print(targetCordinate)  // 緯度経度情報
                
                
                
                
                // MKPointAnnotation ⇨ 地図のピンを生成
                let pin = MKPointAnnotation()
                
                // ピンを置く場所に緯度経度を設定する
                pin.coordinate = targetCordinate
                
                // ピンが刺す場所のタイトルを取得
                pin.title = searchKey
                
                // .addAnnotationメソッドで実際にViewにピンを描画する
                uiView.addAnnotation(pin)
                
                // MKCoordinateRegion ⇨　ピンが置かれた場所に画面を移動させる設定↓
                uiView.region = MKCoordinateRegion(
                    center: targetCordinate,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0
                )
                
            }
            
        })
        
    }
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー",mapType: .standard)
    }
}
