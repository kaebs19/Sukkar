//
//  CheckoutVC.swift
//  Sukkar
//
//  Created by mjeed on 04/12/2023.
//

import UIKit

class CheckoutVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var productsTVHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    
    var checkoutList = [Checkout(title: "Egyption Blood Glucose Monitor...", Quantity: 1, pricse: "500"),
                        Checkout(title: "Egyption Blood Glucose Monitor...", Quantity: 2, pricse: "200"),
                        Checkout(title: "Egyption Blood Glucose Monitor...", Quantity: 3, pricse: "100"),
                        Checkout(title: "Egyption Blood Glucose Monitor...", Quantity: 4, pricse: "50")
    
    
    ]

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    // MARK: -  Configure Action - Func
    
    private func setupView() {
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.reloadDate()
    }

    
}

// MARK: -  TableView Delegate & DataSource
extension CheckoutVC: UITableViewDelegate {
    
    private func setupTableView() {
        productsTableView.addBorderAndWhith(color: UIColor.gray, width: 0.7)
        productsTableView.addRadius(radius: 10)
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.register(UINib(nibName: "CheckoutCell", bundle: nil), forCellReuseIdentifier: "CheckoutCell")
        productsTVHeightConstraint.constant = CheckoutCell.height * CGFloat(checkoutList.count)
        reloadDate()
    }
    
    private func reloadDate() {
        productsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CheckoutCell.height
    }
    
}

extension CheckoutVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkoutList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutCell", for: indexPath ) as? CheckoutCell else {return UITableViewCell()}
        let date = checkoutList[indexPath.row]
        cell.setupCell(date)
        return cell
    }
    
    
}
