//
//  CartCell.swift
//  Sukkar
//
//  Created by mjeed on 19/11/2023.
//

import UIKit


protocol CartProtocol:NSObjectProtocol {
    
    func cartDeleteClickedButton(_ index: Int)
    
    func minusClickedButton(_ index: Int)
    
    func plusClickedButton(_ index: Int)
}


class CartCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var cartTitleLable: UILabel!
    @IBOutlet weak var cartPricseLable: UILabel!
    
    @IBOutlet weak var CartCountLable: UILabel!
    
    
    // MARK: - Variables
    static let idCell = "CartCell"
    static let height:CGFloat = 107
    
    // protocol
    var inex: Int = 0
    weak var deleaget: CartProtocol?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cartImage.addRadius(radius: 4)
        
    }
    
    @IBAction func cartDeleteClickedButton(_ sender: UIButton) {
        
        deleaget?.cartDeleteClickedButton(inex)
    }
    
    @IBAction func minusClickedButton(_ sender: UIButton) {
        deleaget?.minusClickedButton(inex)
    }
    
    
    @IBAction func plusClickedButton(_ sender: UIButton) {
        deleaget?.plusClickedButton(inex)
    }
    
    
    func getUpCellDate(_ getupCell:CartModel) {
        cartTitleLable.text = getupCell.title
        cartPricseLable.text = getupCell.price
        CartCountLable.text = "\(getupCell.count)"
    }
}
