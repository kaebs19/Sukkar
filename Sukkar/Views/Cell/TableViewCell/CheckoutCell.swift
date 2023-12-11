//
//  CheckoutCell.swift
//  Sukkar
//
//  Created by mjeed on 04/12/2023.
//

import UIKit

class CheckoutCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var quantityLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    // MARK: - Variables

    static let height:CGFloat = 75
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkImage.addRadius(radius: 10)

    }

    // MARK: -  Configure Action - Func
    func setupCell(_ data: Checkout) {
        titleLable.text = data.title
        quantityLable.text = "\(data.Quantity)"
        priceLable.text = data.pricse
        
    }
    
    
}
