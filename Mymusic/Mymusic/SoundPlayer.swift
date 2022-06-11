//
//  SoundPlayer.swift
//  Mymusic
//
//  Created by 中川賢亮 on 2022/04/07.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    
    // 音源データ「シンバル」の読み込み
    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    let guitarData = NSDataAsset(name: "guitarSound")!.data
    
    // 音源再生に必要なAVAudioPlayerを変数に入れる
    var cymbalPrayer: AVAudioPlayer!
    var guitarPlayer: AVAudioPlayer!
    
    // 音源再生のためのメソッド
    func cymbalPlay() {
        
        do {
            
            // プレイヤーにシンバルの音データを指定
            cymbalPrayer = try AVAudioPlayer(data: cymbalData)
            
            // 音源を再生
            cymbalPrayer.play()
            
        } catch {
            
            // do...try...catch文でエラー発生時の処理を記述  do...の{}内でエラーが発生したら、即座にcatch内の処理が実行される
            // AVAudioPlayerのようなエラーが起こりやすいものを扱う際は、エラーの時用の処理が書かれていないと予期せぬエラーが発生した際にアプリが強制終了してしまう
            
            print("シンバルでエラーが発生しました")
        }
        
    }
    
    func guitarPlay() {
        
        do {
            
            guitarPlayer = try AVAudioPlayer(data: guitarData)
            
            guitarPlayer.play()
            
        } catch {
            
            print("ギターでエラーが発生しました")
            
        }
        
    }
    
}
