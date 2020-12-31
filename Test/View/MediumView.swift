//
//  MediumView.swift
//  WidgetTest
//
//  Created by user on 2020/12/17.
//

import SwiftUI



struct MediumView: View {
    
    var data: CoinData
    
    var body: some View {
        if data.btc != nil {
            HStack {
                VStack(){
                    Text(data.btc!.name!).font(.system(size: 10)).foregroundColor(.white)
                    Text(data.btc!.price!).font(.caption).fontWeight(.bold).foregroundColor((data.btc?.changeRate?.hasPrefix("-"))! ? .red : .green)
                    Text(data.btc!.changeRate!).font(.caption2).foregroundColor((data.btc?.changeRate?.hasPrefix("-"))! ? .red : .green)
                    Text("≈￥\(data.btc!.cnyPrice!)").font(.system(size: 8)).fontWeight(.bold).foregroundColor(.gray)
                    SwiftUILineView(dataArr: data.btc!.line!, isUp: !(data.btc?.changeRate?.hasPrefix("-"))!).frame(width: 88, height: 40)
                }
                .padding(.trailing)
                
                VStack(){
                    Text(data.eth!.name!).font(.system(size: 10)).foregroundColor(.white)
                    Text(data.eth!.price!).font(.caption).fontWeight(.bold).foregroundColor((data.eth?.changeRate?.hasPrefix("-"))! ? .red : .green)
                    Text(data.eth!.changeRate!)
                        .font(.caption2)
                        .foregroundColor((data.eth?.changeRate?.hasPrefix("-"))! ? .red : .green)
                    Text("≈￥\(data.eth!.cnyPrice!)").font(.system(size: 8)).fontWeight(.bold).foregroundColor(.gray)
                    SwiftUILineView(dataArr: data.eth!.line!, isUp: !(data.eth?.changeRate?.hasPrefix("-"))!).frame(width: 88, height: 40)
                    
                }
                
                VStack(){
                    Text(data.dpom!.name!).font(.system(size: 10)).foregroundColor(.white)
                    Text(data.dpom!.price!).font(.caption).fontWeight(.bold).foregroundColor((data.dpom?.changeRate?.hasPrefix("-"))! ? .red : .green)
                    Text(data.dpom!.changeRate!).font(.caption2).foregroundColor((data.dpom?.changeRate?.hasPrefix("-"))! ? .red : .green)
                    Text("≈￥\(data.dpom!.cnyPrice!)").font(.system(size: 8)).fontWeight(.bold).foregroundColor(.gray)
                    SwiftUILineView(dataArr: data.dpom!.line!, isUp: !(data.dpom?.changeRate?.hasPrefix("-"))!).frame(width: 88, height: 40)
                }
                .padding(.leading)
            }.frame(width: 500.0, height: 200.0).background(Color(red: 13.0 / 255.0, green: 26.0 / 255.0, blue: 31.0 / 255.0))
        } else {
            Text("无数据")
        }
    }
}

struct MediumView_Previews: PreviewProvider {
    static var previews: some View {
        MediumView(data: sampleData)
            .preferredColorScheme(.dark)
    }
}
