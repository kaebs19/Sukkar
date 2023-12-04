//
//  DiabeticSuppliesVC.swift
//  Sukkar
//
//  Created by mjeed on 26/11/2023.
//

import UIKit

class ProductsVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var prouductTableView: UITableView!
    
    
    // MARK: - Variables
    var productList:[Products] = [Products(title: "Egyption Blood Glucose...", pricc: "200 RS", isFav:  false),
                                  Products(title: "Egyption Blood Glucose...", pricc: "100 RS", isFav:  true),
                                  Products(title: "National Blood Glucose...", pricc: "230 RS", isFav:  false),
                                  Products(title: "National Blood Glucose...", pricc: "290 RS", isFav:  false),
    
    
    ]

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        confgeView()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        confgeView()
    }
    
    // MARK: -  Configure Action - Func

    private func confgeView() {
        self.setupTableView()
        self.reloadDAtaTableView()
    }


    
}

// MARK: -  TableView Delegate & DataSource
extension ProductsVC: UITableViewDelegate {
    private func setupTableView() {
        prouductTableView.delegate = self
        prouductTableView.dataSource = self
        prouductTableView.register(UINib(nibName: ProuductCell.idCell, bundle: nil), forCellReuseIdentifier: ProuductCell.idCell)
    }
    
    private func reloadDAtaTableView() {
        prouductTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProuductCell.height*iPhoneXFactor
    }
    
}

extension ProductsVC: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProuductCell.idCell , for: indexPath) as?ProuductCell else {return UITableViewCell()}
        let data = productList[indexPath.row]
        cell.getupDaata(data: data)
        cell.index = indexPath.row
        cell.deleaget = self
        return cell
    }
    
    
}

extension ProductsVC: ProuductProtocol {
    
    func isFavClickedButton(_ index: Int) {
        productList[index].isFav.toggle()
        self.reloadDAtaTableView()
        
    }
    
    
}
