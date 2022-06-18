//
//  ContentView.swift
//  iExpense
//
//  Created by Yi An Chen on 2022/2/5.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    //@StateObject is only use for creating a class instance
    @State private var showingAddExpense = false
    
    var expensesByPersonal: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }
    var expensesByBusiness: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
    }
    
    var body: some View {
        NavigationView {
            List {
//                ForEach(expenses.items, id: \.id) { item in
//                    Text(item.name)
//                }
//                .onDelete(perform: { indexSet in
//                 removeItems(at: indexSet)
//               })
//                .onDelete(perform: removeItems)
//                //logic error
                
                
                //now expenses is guarantee to be unique, so don't need id anymore
                Section("Personal") {
                    ForEach(expensesByPersonal) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
//                                Text(item.type)
//                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: expenses.currencyFormat)
                                .foregroundColor(priceColor(item.amount))
                        }
                        .accessibilityElement()
                        .accessibilityLabel("\(item.name), \(item.amount.formatted(expenses.currencyFormat))")
                        .accessibilityHint("Personal")
                    }
                    .onDelete(perform: { indexSet in
                        let index = indexSet.first
                        if let indexUnwrapped = index {
                            let itemID = expensesByPersonal[indexUnwrapped].id
                            removeMajorItems(itemID)
                        }
                    })
    //                .onDelete(perform: { indexSet in
    //                    removeItems(at: indexSet)
    //                })
//                    .onDelete(perform: removeItems)
                }
                //logic error
                
                
                Section("Business") {
                    ForEach(expensesByBusiness) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: expenses.currencyFormat)
                                .foregroundColor(priceColor(item.amount))
                        }
                        .accessibilityElement()
                        .accessibilityLabel("\(item.name), \(item.amount.formatted(expenses.currencyFormat))")
                        .accessibilityHint("Personal")
                    }
                    .onDelete(perform: { indexSet in
                        let index = indexSet.first
                        if let indexUnwrapped = index {
                            let itemID = expensesByBusiness[indexUnwrapped].id
                            removeMajorItems(itemID)
                        }
                    })
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
//    func removeItems(at offsets: IndexSet) {
//        expenses.items.remove(atOffsets: offsets)
//    }
    func removeMajorItems(_ itemID: UUID) {
        let itemIndex = expenses.items.firstIndex {$0.id == itemID }
        if let itemIndexUnwrapped = itemIndex {
            expenses.items.remove(at: itemIndexUnwrapped)
        }
    }
    
    func priceColor(_ amount: Double) -> Color {
        if amount > 100 {
            return Color.red
        } else if amount > 10 {
            return Color.orange
        }
        
        return Color.black
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
