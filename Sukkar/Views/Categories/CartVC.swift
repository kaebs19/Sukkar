//
//  CategoriesVC.swift
//  Sukkar
//
//  Created by mjeed on 19/11/2023.
//

import UIKit

class CartVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cartTableView: UITableView!
    
    
    
    
    // MARK: - Variables

    var cartList:[CartModel] = []
    
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        cartList.append(CartModel(title: "Egyption Medical Headsets", price: "6.34 RS", count: 1))
        cartList.append(CartModel(title: "Chines Thermomerers", price: "100 RS", count: 1))
        cartList.append(CartModel(title: "Chines Thermomerers", price: "500 RS", count: 1))
        cartList.append(CartModel(title: "National Blood", price: "200 RS", count: 1))
        cartList.append(CartModel(title: "National Blood", price: "143 RS", count: 1))

    }
    // MARK: -  Configure Action - Func

    private func setup() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(UINib(nibName: CartCell.idCell, bundle: nil), forCellReuseIdentifier: CartCell.idCell)
    }

    
}

// MARK: -  TableView Delegate

extension CartVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CartCell.height
    }
    
}

// MARK: -  TableView   DataSource

extension CartVC:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.idCell, for: indexPath) as? CartCell else {return UITableViewCell()}
        let date = cartList[indexPath.row]
        cell.getUpCellDate(date)
        cell.deleaget = self
        cell.inex = indexPath.row
        return cell
    }
    
    
}


extension CartVC: CartProtocol {
    
    
    func cartDeleteClickedButton(_ index: Int) {
        cartList.remove(at: index)
        cartTableView.reloadData()
    }
    
 
    
    func plusClickedButton(_ index: Int) {
        cartList[index].count  += 1
        cartTableView.reloadData()
    }
    
    func minusClickedButton(_ index: Int) {
        
        if cartList[index].count > 1 {
            cartList[index].count -= 1
            cartTableView.reloadData()
        }
        

    }
    
}
