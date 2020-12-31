//
//  Test.swift
//  Test
//
//  Created by user on 2020/10/29.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), data: sampleData, singleData: sampleData.btc!, requestError: false)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), data: sampleData, singleData: sampleData.btc!, requestError: false)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        DataLoader.fetch(tag: configuration.coinType.rawValue) { (result) in
            let currentDate = Date()
            let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
            var (coinData, singleData): (CoinData, SingleData)
            let errorRequest: Bool
            switch result {
            case .success(let (cdata, sdata)):
                coinData = cdata
                singleData = sdata
                errorRequest = false
            default:
                coinData = CoinData()
                singleData = SingleData()
                errorRequest = true
            }
            let entry = SimpleEntry(date: refreshDate, data: coinData, singleData: singleData, requestError: errorRequest)
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let data: CoinData
    let singleData: SingleData
    let requestError: Bool
}

struct TestEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry

    var body: some View {
        if entry.requestError {
            Text("网络请求失败")
        } else {
            switch family {
            case .systemSmall:
                SingleView(data: entry.singleData)
            case .systemMedium:
                MediumView(data: entry.data)
            case .systemLarge:
                LargeView(data: entry.data)
            default:
                SingleView(data: entry.singleData)
            }
        }
    }
}

@main
struct Test: Widget {
    let kind: String = "Test"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            TestEntryView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 13.0 / 255.0, green: 26.0 / 255.0, blue: 31.0 / 255.0))
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        TestEntryView(entry: SimpleEntry(date: Date(), data: sampleData, singleData: sampleData.btc!, requestError: false))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
