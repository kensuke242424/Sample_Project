//
//  CardViewModel.swift
//  SampleTinderApp
//
//  Created by 中川賢亮 on 2022/06/18.
//

import SwiftUI

class CardViewModel: ObservableObject {

    // .zero = (x: 0, y: 0)
    @State var translation: CGSize = .zero
    @State var numbers = [0,1,2,3,4,5]
    @State var goodOpacity: Double = 0
    @State var nopeOpacity: Double = 0

}
