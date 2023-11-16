//
//  OrdersVC.swift
//  Sukkar
//
//  Created by mjeed on 05/11/2023.
//

import UIKit

class OrdersVC: UIViewController  {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var orderTableView: UITableView!
    
    
    
    // MARK: - Variables
    
    var dateArr = [OrdersModels(date: "09/12/2019", orderNumber: "Order No. 100", Price: "235.630 RS", status: .Delivered),
                   OrdersModels(date: "02/09/2020", orderNumber: "Order No. 105", Price: "33.630 RS", status: .Pending),
                   OrdersModels(date: "08/10/2021", orderNumber: "Order No. 104", Price: "444.630 RS", status: .Processing),
                   OrdersModels(date: "10/12/2022", orderNumber: "Order No. 103", Price: "450.630 RS", status: .Delivered),
                   OrdersModels(date: "07/10/2023", orderNumber: "Order No. 101", Price: "245.630 RS", status: .Pending)]
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    // MARK: -  Configure Action - Func
    
    
    
    
}

extension OrdersVC {
    private func setUp() {
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.register(UINib(nibName: OrdersCell.cellID , bundle: nil), forCellReuseIdentifier: OrdersCell.cellID)
        orderTableView.separatorStyle = .none
    }
}

// MARK: -  TableView Delegate

extension OrdersVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return OrdersCell.heght
    }
}


// MARK: -  TableView   DataSource

extension OrdersVC : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrdersCell.cellID, for: indexPath) as? OrdersCell else {return UITableViewCell()}
        let date = dateArr[indexPath.row]
        
        cell.getup(cellDate: date)
        
        return cell
    }
    
    
}
