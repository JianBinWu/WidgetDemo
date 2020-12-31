//
//  SwiftUILineView.swift
//  WidgetTest
//
//  Created by user on 2020/12/21.
//

import SwiftUI

struct SwiftUILineView: View {
    static let gradientStartGreen = Color(red: 3.0 / 255, green: 192.0 / 255, blue: 135.0 / 255)
    static let gradientStartRed = Color(red: 255.0 / 255, green: 87.0 / 255, blue: 85.0 / 255)
    static let gradientEnd = Color(red: 0.05098, green: 0.10196, blue: 0.121568, opacity: 0.01)
    
    var dataArr: [LinePoint]
    var isUp: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            Path { path in
                for (index, model) in dataArr.enumerated() {
                    if index == 0 {
                        path.move(to: CGPoint(x: model.centerX!, y: model.colseY!))
                    } else {
                        path.addLine(to: CGPoint(x: model.centerX!, y: model.colseY!))
                    }
                }
            }
            .stroke(lineWidth: 1)
            .stroke(isUp ? Self.gradientStartGreen : Self.gradientStartRed)
            
            Path { path in
                for (index, model) in dataArr.enumerated() {
                    if index == 0 {
                        path.move(to: CGPoint(x: model.centerX!, y: geo.size.height))
                        path.addLine(to: CGPoint(x: model.centerX!, y: model.colseY!))
                    } else if index == dataArr.count - 1 {
                        path.addLine(to: CGPoint(x: model.centerX!, y: model.colseY!))
                        path.addLine(to: CGPoint(x: model.centerX!, y: geo.size.height))
                        path.closeSubpath()
                    } else {
                        path.addLine(to: CGPoint(x: model.centerX!, y: model.colseY!))
                    }
                }
            }
            .fill(LinearGradient(gradient: Gradient(colors: [isUp ? Self.gradientStartGreen : Self.gradientStartRed, Self.gradientEnd]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1)))
            .opacity(0.2)
        }
        
        
        
    }
}

struct SwiftUILineView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILineView(dataArr: [LinePoint](), isUp: true)
    }
}
