//
//  ButtonImageView.swift
//  Mymusic
//
//  Created by 中川賢亮 on 2022/04/07.
//

import SwiftUI

struct ButtonImageView: View {
    
    let imageName: String
    
    var body: some View {
        
        Image(imageName)
            .renderingMode(.original)
        
    }
}

struct ButtonImageView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImageView(imageName: "cymbal")
    }
}
