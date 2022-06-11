//
//  OkashiData.swift
//  MyOkashiApp
//
//  Created by 中川賢亮 on 2022/05/18.
//

import Foundation
import UIKit


// Identifiableプロトコルを利用して、お菓子の情報をまとめる構造体
struct OkashiItem: Identifiable {
    let id = UUID() //UUID　→　ランダムな一意の値を生成することができる
    let name: String
    let link: URL
    let image: UIImage
}


// お菓子データ検索用のクラス
class OkahiData: ObservableObject {
    
    // JSONのitem内のデータ構造
    struct ResultJson: Codable {
        
        struct Item: Codable {
            
            //お菓子の名称
            let name: String?
            //掲載URL
            let url: URL?
            //画像URL
            let image: URL?
            
        }
        //上記のname,url,imageを配列で格納してまとめて管理している
        let item: [Item]?
        
    }// struct ResultJson
    
    // お菓子のリスト（Identifiableプロトコル）
    @Published var okashiList: [OkashiItem] = []
    
    
    
    func searchOkashi(keyword: String) {
        
        print(keyword)
        
        // 検索キーワードをエンコード
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        // リクエストURLの組み立て
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {return}
        
        print(req_url)
        
        // リクエストに必要な情報を生成
        let req = URLRequest(url: req_url)
        // データ転送を管理するためのセッションを作成(セッションとは、検索の始まりから終わりまでのこと)
        // 第三引数　OperationQueue.main ⇨ 非同期処理で行うことができる
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        // リクエストをタスクとして登録
        // completionHandler　⇨ データのダウンロードが完了した際に行いたい処理を{}内に記述
        let task = session.dataTask(with: req, completionHandler: {
            // 以下の三つの引数に返却される data→jsonダウンロード後のデータを格納、　response→通信の状態を示す情報が格納、　error→ダウンロードが失敗した時のエラー内容が格納
            (data, response, error) in
            
            // セッションの終了
            session.finishTasksAndInvalidate()
            do {
                // JsonDecoderのインスタンスを取得
                let decoder = JSONDecoder()
                // 受け取ったJSONデータをパース（解析）して格納
                let json = try decoder.decode(ResultJson.self, from: data!)
                
//                print(json)
                
                // お菓子の情報が取得できているか確認
                if let items = json.item {
                    // お菓子のリストを初期化
                    self.okashiList.removeAll()
                    // 取得しているお菓子の数だけ処理
                    for item in items {
                        // お菓子の名称、掲載URL、画像URLをアンラップ
                        if let name = item.name,
                           let link = item.url,
                           let imageUrl = item.image,
                           let imageData = try? Data(contentsOf: imageUrl),
                           let image = UIImage(data: imageData)?.withRenderingMode(.alwaysOriginal) {
                            
                            // １つのお菓子を構造体OkashiItemでまとめて管理
                            let okashi = OkashiItem(name: name, link: link, image: image)
                            // お菓子の配列へ追加
                            self.okashiList.append(okashi)
                        }
                    }
                    
                }
                print(self.okashiList)
                
            } catch {
                print("エラーが発生しました！")
            }
        })
        // ダウンロード開始
        task.resume()
    }
    
}
 
