//
//  ContentView.swift
//  MyOkashiApp
//
//  Created by 中川賢亮 on 2022/05/18.
//

import SwiftUI

struct ContentView: View {
    
    // OkashiDataを参照する状態変数
    @ObservedObject var okashiDataList = OkahiData()
    // 入力された文字列を保持する状態変数
    @State var inputText = ""
    
    @State var showSafari = false
    
    
    var body: some View {
        
        VStack {
            
            TextField("キーワードを入力してください", text: $inputText, onCommit: {
                
                //入力完了後に検索をする
                okashiDataList.searchOkashi(keyword: inputText)
            })
            .padding()
            
            List(okashiDataList.okashiList) { okashi in
                
                Button(action: {
                    
                    showSafari.toggle()
                    
                }) {
                    
                    HStack {
                        Image(uiImage: okashi.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                        Text(okashi.name)
                    }
                }
                .sheet(isPresented: self.$showSafari, content: {
                    
                    SafariView(url: okashi.link)
//                        .edgesIgnoringSafeArea(.bottom)
                    
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
