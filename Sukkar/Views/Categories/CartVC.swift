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
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var checkOutButton: UIButton!
    
    
    
    // MARK: - Variables

    var cartList:[CartModel] = []
    
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        totalView.layer.cornerRadius = 7
        checkOutButton.addRadius(radius: 7)
        
        
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
    
    func moveItemToTop(at index: Int) {
        guard index > 0 else { return }
        let itemToMove = cartList.remove(at: index)
        cartList.insert(itemToMove, at: 0)
    }


    
}

// MARK: -  TableView Delegate

extension CartVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CartCell.height
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { action , view, completion in
            self.cartList.remove(at: indexPath.row)
            completion(true)
            self.cartTableView.reloadData()
        }
        
        let moveToTop = UIContextualAction(style: .normal, title: "Move to Top") { action , view , completion in
            self.moveItemToTop(at: indexPath.row)
            completion(true)
            self.cartTableView.reloadData()

        }
        
        moveToTop.backgroundColor = UIColor.systemBlue
        delete.backgroundColor = UIColor.systemRed
        
        let swipe = UISwipeActionsConfiguration(actions: [delete , moveToTop])
        
        return swipe
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
