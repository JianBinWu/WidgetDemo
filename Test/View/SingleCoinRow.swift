//
//  SingleCoinRow.swift
//  WidgetTest
//
//  Created by user on 2020/12/18.
//

import SwiftUI

struct SingleCoinRow: View {
    
    var data: SingleData
    
    var body: some View {
        
        HStack {
            Image((String(data.name!.split(separator: "/")[0])))
                .resizable()
                .frame(width: 30, height: 30)
            Text(data.firstName!).font(.caption).foregroundColor(.white) + Text(data.lastName!).font(.system(size: 10)).foregroundColor(Color(red: 62.0 / 255.0, green: 123.0 / 255.0, blue: 130.0 / 255.0))
            Spacer()
            VStack {
                
            }
            Text(data.price!).font(.caption).foregroundColor((data.changeRate?.hasPrefix("-"))! ? .red : .green)
            Text(data.changeRate!).font(.system(size: 10)).foregroundColor(.white)
                    .frame(width: 60, height: 30)
                    .background((data.changeRate?.hasPrefix("-"))! ? Color.red : Color.green)
                    .cornerRadius(5)
            
        }
    }
}

struct SingleCoinRow_Previews: PreviewProvider {
    static var previews: some View {
        SingleCoinRow(data: sampleData.btc!)
            .previewLayout(.fixed(width: 300, height: 50))
            .frame(width: .infinity, height: .infinity)
            .background(Color(red: 13.0 / 255.0, green: 26.0 / 255.0, blue: 31.0 / 255.0))
    }
}
