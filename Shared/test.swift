//
//  test.swift
//  Cryptocurrency
//
//  Created by Amir Mohammad on 5/3/1401 AP.
//

import SwiftUI

struct CustomListSectionView: View {
    @ObservedObject var listSection : CustomListSection

    var body: some View {
        VStack(spacing: 0) {
            headerView
                .padding(8)
            listView
                .padding()
                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.white))
                .padding(.horizontal)
            footerView
                .padding(8)
        }
        .background(Color.secondary)
    }
    
    var headerView : some View {
        HStack {
            Text(listSection.header)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                .foregroundColor(.primary)
            Spacer()
        }
    }
    
    var listView : some View {
        VStack(spacing: 3) {
            ForEach(Array(listSection.items.enumerated()), id: \.offset) { index, item in
                CustomListItemView(color: listSection.color).environmentObject(item)
                if index < listSection.items.count - 1 {
                    Divider()
                }
            }
        }
    }

    var footerView : some View {
        HStack {
            Spacer()
            Text("Sum:")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.secondary)
            Text(CustomListSectionView.formatter().string(from: NSNumber(value: listSection.total)) ?? "-")
                .font(.system(size: 18, weight: .medium, design: .rounded).monospacedDigit())
                .foregroundColor(.primary)
        }
    }
    
    static func formatter() -> NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale.current
        currencyFormatter.numberStyle = .currency
        currencyFormatter.usesGroupingSeparator = true
        return currencyFormatter
    }
}

struct CustomListItemView: View {
    @EnvironmentObject var listItem : CustomListItem
    let color : Color
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: listItem.symbol)
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(6)
                    .background(Circle().foregroundColor(color))
            }
            .shadow(radius: 3)
            Text(listItem.name)
            Spacer()
            Button(action: { listItem.select.toggle() }) {
                Image(systemName: listItem.select ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.accentColor)
                    .padding(6)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

class CustomListSection: ObservableObject, Hashable {
    // hashable so id: \.self work in ForEach's
    let id = UUID()
    let header : String
    let color : Color
    @Published var items : [CustomListItem] = []
    @Published var total : Double = 0
    
    func add(_ name: String, _ symbol: String, _ amount: Double) {
        items.append(CustomListItem(name, symbol, amount, calc))
    }
    
    func calc() {
        total = items.map({ $0.price }).reduce(0, +)
    }
    
    init(_ header: String, _ color: Color) {
        self.header = header
        self.color = color
    }
    
    public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
    
    static func == (lhs: CustomListSection, rhs: CustomListSection) -> Bool {
        lhs.id == rhs.id
    }
}

class CustomListItem: ObservableObject, Hashable {
    @Published var select : Bool = false { didSet {
        withAnimation { calc() }
    } }
    let name : String
    let symbol : String
    @Published var amount : Double
    let calc : () -> Void

    init(_ name: String, _ symbol: String, _ amount: Double, _ calc: @escaping () -> Void) {
        self.name = name
        self.symbol = symbol
        self.amount = amount
        self.calc = calc
    }

    var price : Double { select ? amount : 0 }
    
    // hashable so id: \.self work in ForEach's
    let id = UUID()

    public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
    
    static func == (lhs: CustomListItem, rhs: CustomListItem) -> Bool {
        lhs.id == rhs.id
    }
}

struct CustomListSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let section = CustomListSection("Section Name", .purple)
        section.add("Alpha Item", "a.circle", 1000)
        section.add("Delta Item", "d.circle", 100)
        section.add("Omega Item", "z.circle", 1)
        return CustomListSectionView(listSection: section)
    }
}
//struct test_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomListSectionView(listSection: [])
//    }
//}
