//
//  ChartView.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/19.
//

import SwiftUI

struct ChartView: View {
    let width: Double
    let height: Double
    let item: ActivityItem
    
    let yAxisOffset = 35.0
    let xAxisOffset = 25.0
    
    @State private var graphAmount = 1000.0
    
    var thisYear: Int { Calendar.current.dateComponents([.year], from: Date.now).year ?? 0 }
    var filteredDayComponent: [DateComponents] {
        item.days.filter { $0.year == thisYear }
    }
    var data: [Double] {
        var tempArray = [Double]()
        for i in 1...12 {
            let component = DateComponents(year: thisYear, month: i)
            let month = Calendar.current.date(from: component)
            guard let unwrappedMonth = month else {
                continue
            }
            let range = Calendar.current.range(of: .day, in: .month, for: unwrappedMonth)
            guard let unwrappedRange = range else {
                continue
            }
            let allDays = Double(unwrappedRange.count)
            
            let arrays = filteredDayComponent.filter { $0.month == i }
            let doneDays = Double(arrays.count)
            tempArray.append(doneDays / allDays)
        }
        
        return tempArray
    }
    
    
    var body: some View {
        Canvas { context, size in
            
            let frameRect = CGRect(origin: .zero, size: CGSize(width: size.width, height: size.height - 25)).insetBy(dx: 0, dy: 1)
            var gridLine = Path()

            let yAxies = [
                (y: frameRect.maxY, label: ""),
                (y: frameRect.maxY * 0.8, label: 0.2.formatted(.percent)),
                (y: frameRect.maxY * 0.6, label: 0.4.formatted(.percent)),
                (y: frameRect.maxY * 0.4, label: 0.6.formatted(.percent)),
                (y: frameRect.maxY * 0.2, label: 0.8.formatted(.percent)),
                (y: frameRect.minY, label: 1.0.formatted(.percent)),
            ]
            
            for yItem in yAxies {
                gridLine.move(to: CGPoint(x: 0, y: yItem.y))
                gridLine.addLine(to: CGPoint(x: frameRect.maxX, y: yItem.y))
                
                let text = Text(yItem.label).font(.caption).foregroundColor(Color.gray)
                context.draw(text, at: CGPoint(x: 0, y: yItem.y + 2), anchor: .topLeading)
            }
            
            context.stroke(gridLine, with: .color(.systemGray4))
            
            let horizonLabelRect = CGRect(origin: CGPoint(x: yAxisOffset, y: size.height - xAxisOffset), size: CGSize(width: size.width - yAxisOffset, height: xAxisOffset)).insetBy(dx: 0, dy: 1)
            
            let labelWidth = horizonLabelRect.width / 12
            let labelStartPosition = labelWidth / 2
            for i in 0...11 {
                let xPoint = labelStartPosition + labelWidth * Double(i)
                let labelText = String(format: "%02d", i + 1)
                let text = Text(labelText).font(.caption).foregroundColor(Color.gray)
                context.draw(text, at: CGPoint(x: horizonLabelRect.minX + xPoint , y: horizonLabelRect.midY))
            }
            
            let symbol = context.resolveSymbol(id: 0)
            guard let unwrappedSymbol = symbol else {
                return
            }
            context.draw(unwrappedSymbol, at: .init(x: yAxisOffset, y: 0), anchor: .topLeading)
            
            
        } symbols: {
            Graph(data: data)
                .stroke(item.color, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .bevel, dash: [1000], dashPhase: graphAmount))
                .frame(width: width - yAxisOffset, height: height - xAxisOffset)
                .tag(0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2)) {
                        graphAmount = 0
                    }
                }
        }
        .frame(width: width, height: height)
        .drawingGroup()
    }
}

struct ChartView_Previews: PreviewProvider {
    
    static var days: Set<DateComponents> {
        var tempArray = Set<DateComponents>()
        for _ in 0...85 {
            let date = Calendar.current.date(byAdding: .day, value: Int.random(in: -1000...0), to: Date.now)
            
            guard let unwrappedDate = date else {
                continue
            }
            
            let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .weekday], from: unwrappedDate)
            tempArray.insert(dateComponent)
        }
        return tempArray
    }
    static let item = ActivityItem(title: "Mediation", color: .orange, goal: 100, days: days)
    
    static var previews: some View {
        GeometryReader { proxy in
            ChartView(width: proxy.size.width, height: proxy.size.height, item: item)
        }
        .previewLayout(.fixed(width: 256, height: 170))
    }
}
