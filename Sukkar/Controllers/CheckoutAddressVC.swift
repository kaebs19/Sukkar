//
//  CheckoutAddressVC.swift
//  Sukkar
//
//  Created by mjeed on 28/12/2023.
//

import UIKit

class CheckoutAddressVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var addressCV: UICollectionView!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var pricceView: UIView!
    
    // MARK: - Variables
    
    var checkoutList = [Checkout(title: "Egyption Blood Glucose Monitor...", Quantity: 1, pricse: "500RS"),
                        Checkout(title: "Egyption Blood Glucose Monitor...", Quantity: 2, pricse: "200RS"),
                        Checkout(title: "Egyption Blood Glucose Monitor...", Quantity: 3, pricse: "100RS"),
                        Checkout(title: "Egyption Blood Glucose Monitor...", Quantity: 4, pricse: "50RS")
                        ]

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    
    
}

// MARK: -  CollectionView Delegate & DataSource


extension CheckoutAddressVC {
    private func initUI() {
        initCV(cv: addressCV)
        initTV(tv: productsTableView)
        pricceView.addRadius(radius: 6)
        pricceView.addBorder(borderColor: .CE2E2E2, whithSize: 1)
    }
    
    func initCV(cv: UICollectionView ){
        cv.delegate = self
        cv.dataSource = self
        cv.register(UINib(nibName: "CurrentLocationCVCell", bundle: nil), forCellWithReuseIdentifier: "CurrentLocationCVCell")
        cv.register(UINib(nibName: "NewAddressCVCell", bundle: nil), forCellWithReuseIdentifier: "NewAddressCVCell")
        cv.register(UINib(nibName: "AddressCVCell", bundle: nil), forCellWithReuseIdentifier: "AddressCVCell")

    }
    
    private func initTV(tv: UITableView) {
        tv.dataSource = self
        tv.delegate = self
        tv.registerNib(cellClass: CheckoutCell.self)
        reloadDate()
    }
    
    private func reloadDate() {
        productsTableView.reloadData()
    }

    
}

extension CheckoutAddressVC: UICollectionViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CheckoutCell.height
    }

}

extension CheckoutAddressVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentLocationCVCell", for: indexPath) as! CurrentLocationCVCell
            return cell
        case 1 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewAddressCVCell", for: indexPath) as! NewAddressCVCell
            return cell
        default :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddressCVCell", for: indexPath) as! AddressCVCell
            return cell

        }
    }
    
}
extension CheckoutAddressVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewHieght = collectionView.bounds.height
        switch indexPath.item {
        case 0 :
            return CGSize(width: collectionViewHieght*0.7078651685, height: collectionViewHieght)
        case 1 :
            return CGSize(width: collectionViewHieght*0.7078651685, height: collectionViewHieght)

        default :
            return CGSize(width: collectionViewHieght*1.4606741573, height: collectionViewHieght)

        }
    }
}



// MARK: -  TableView Delegate & DataSource

extension CheckoutAddressVC: UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CheckoutCell.height
    }

}


extension CheckoutAddressVC: UITableViewDataSource {
    
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
