//
//  AddressesVC.swift
//  Sukkar
//
//  Created by mjeed on 14/11/2023.
//

import UIKit

class AddressesVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var addressTableView: UITableView!
    
    
    // MARK: - Variables

    var addressList = [AddressModel]()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        
        addressList = [AddressModel(titleAddress: "Home Address", datetisAddress: "Saudi, Hawally , Riyadh", isDefault: false),
                       AddressModel(titleAddress: "Uncle Address", datetisAddress: "Saidi, Hawally , Jeddah", isDefault: false),
                       AddressModel(titleAddress: "Work Address", datetisAddress: "Saudi, Hawally , Abhi", isDefault: false),
                       AddressModel(titleAddress: "Office Address", datetisAddress: "Saudi, Hawally , Riyadh", isDefault: false)
        ]



    }
    // MARK: -  Configure Action - Func
    
    private func setTableView() {
        addressTableView.delegate = self
        addressTableView.dataSource = self
        addressTableView.register(UINib(nibName: AddressesCell.addressIDCell, bundle: nil), forCellReuseIdentifier: AddressesCell.addressIDCell)
    }



}


// MARK: -  TableView Delegate

extension AddressesVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AddressesCell.height
    }
}

// MARK: -  TableView  DataSource

extension AddressesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddressesCell.addressIDCell ,for: indexPath)  as? AddressesCell else {return UITableViewCell()}
        let date = addressList[indexPath.row]
        cell.getupCell(getcll: date)
        cell.cellIndex = indexPath.row
        cell.delegate = self
        

        return cell
    }
    
    
}

extension AddressesVC:AdressTablelViewProtocol {
    func idDefaultButtonClicked(index: Int) {
        
        for addressIndex in 0..<addressList.count {
            
            addressList[addressIndex].isDefault = false
        }
        
        addressList[index].isDefault = true
        addressTableView.reloadData()
    }
    
    
}
