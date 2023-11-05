//
//  OrdersCell.swift
//  Sukkar
//
//  Created by mjeed on 05/11/2023.
//

import UIKit

class OrdersCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var orderNumberLable: UILabel!
    @IBOutlet weak var orderDateLable: UILabel!
    
    @IBOutlet weak var orderPriceLable: UILabel!
    
    @IBOutlet weak var stateImageView: UIImageView!
    @IBOutlet weak var stateLable: UILabel!
    // MARK: - Variables
    static let heght: CGFloat = 100
    static let cellID = "OrdersCell"
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainView.addRadius(radius: 7)
        mainView.addBorder(borderColor: .C707070, whithSize: 0.5)
    }

    func getup(cellDate: OrdersModels) {
        
        orderDateLable.text = cellDate.date
        orderNumberLable.text = cellDate.orderNumber
        orderPriceLable.text = cellDate.Price
        
         var color:Colors

        switch cellDate.status{
            
        case .Delivered: color = .C24955C
        case .Pending: color = .CDB0000
        case .Processing: color = .C0079FB
        }
        stateLable.textColor = UIColor(named: color.rawValue)
        stateImageView.tintColor = UIColor(named: color.rawValue)

        
    }
    
    
}
