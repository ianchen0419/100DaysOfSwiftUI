//
//  AddView.swift
//  iExpense
//
//  Created by Yi An Chen on 2022/2/6.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    //we don't want to create a new class, we just want to reuse old one
    @Environment(\.dismiss) var dismiss //no need to specify the type
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount: Double?
    
//    let types = ["Business", "Personal"] //avoid picker change order every time
//    var types = expenses.expenseTypes
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(expenses.expenseTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: expenses.currencyFormat)
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount ?? 0)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
