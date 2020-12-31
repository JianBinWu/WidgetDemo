//
//  SingleView.swift
//  WidgetTest
//
//  Created by user on 2020/10/30.
//

import SwiftUI

struct SingleView: View {
    var data: SingleData?
    
    var body: some View {
        if data?.name != nil {
            VStack(spacing: 0.0){
                Text(data!.name!).font(.system(size: 10)).foregroundColor(.white)
                Text(data!.price!).font(.caption).fontWeight(.bold).foregroundColor((data?.changeRate?.hasPrefix("-"))! ? .red : .green)
                Text(data!.changeRate!).font(.caption2).foregroundColor((data?.changeRate?.hasPrefix("-"))! ? .red : .green)
                Text("≈￥\(data!.cnyPrice!)").font(.system(size: 8)).fontWeight(.bold).foregroundColor(.gray)
                SwiftUILineView(dataArr: data!.line!, isUp: !(data?.changeRate?.hasPrefix("-"))!).frame(width: 88, height: 40)
                
            }.frame(width: 200.0, height: 200.0).background(Color(red: 13.0 / 255.0, green: 26.0 / 255.0, blue: 31.0 / 255.0))
        } else {
            Text("无数据").foregroundColor(.white)
        }
    }
}

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView(data: SingleData())
    }
}
