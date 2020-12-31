//
//  LargeView.swift
//  WidgetTest
//
//  Created by user on 2020/12/18.
//

import SwiftUI

struct LargeView: View {
    
    var data: CoinData
    
    var body: some View {
        if data.btc != nil {
            VStack {
                HStack {
                    Text("Name").font(.system(size: 11)).padding(.leading)
                    Spacer()
                    Text("Price").font(.system(size: 11)).padding(.trailing)
                    Text("Change%").font(.system(size: 11)).padding(.trailing)
                }.foregroundColor(Color(red: 62.0 / 255.0, green: 123.0 / 255.0, blue: 130.0 / 255.0))
                ForEach(data.list!) { singleData in
                    SingleCoinRow(data: singleData)
                        .padding(.horizontal)
                }
            }
        } else {
            Text("无数据")
        }
    }
}

struct LargeView_Previews: PreviewProvider {
    static var previews: some View {
        LargeView(data: sampleData)
    }
}
