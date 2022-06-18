//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Yi An Chen on 2022/2/6.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    //uuid: Universally Unique IDentifier
    var id = UUID() //it can be overwritten if it exist the data, otherwise it won't be
    let name: String
    let type: String
    let amount: Double
}
