//
//  OrdersModels.swift
//  Sukkar
//
//  Created by mjeed on 05/11/2023.
//

import UIKit

enum Status: String {
    case Delivered = "Delivered"
    case Pending = "Pending"
    case Processing = "Processing"
}

struct OrdersModels {
    var date: String
    var orderNumber: String
    var Price:String
    var status: Status
}
