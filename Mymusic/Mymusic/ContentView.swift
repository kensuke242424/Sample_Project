//
//  ContentView.swift
//  Mymusic
//
//  Created by 中川賢亮 on 2022/04/07.
//

import SwiftUI

struct ContentView: View {
    
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        
       
        
        
        ZStack {
            
            Image("background")
                // リサイズ
                .resizable()
                // セーフエリア外いっぱいまで表示されるようにする
                .edgesIgnoringSafeArea(.all)
                // アスペクト比（縦横比）を維持して短編基準に収まるようにする
                .aspectRatio(contentMode: .fill)
            
            
            HStack {
                
                Button(action: {
                    
                    soundPlayer.cymbalPlay()
                    
                }) {
                   ButtonImageView(imageName: "cymbal")
                    
                }
                
                Button(action: {
                    
                    soundPlayer.guitarPlay()
                    
                }) {
                    
                    ButtonImageView(imageName: "guitar")
                }
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
