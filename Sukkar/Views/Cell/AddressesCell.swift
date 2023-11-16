//
//  AddressesCell.swift
//  Sukkar
//
//  Created by mjeed on 14/11/2023.
//

import UIKit


protocol AdressTablelViewProtocol: NSObjectProtocol{
    
    func idDefaultButtonClicked(index: Int)
}


class AddressesCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLable:UILabel!
    @IBOutlet weak var dateilsLable: UILabel!
    @IBOutlet weak var isDefaultImage: UIImageView!
    @IBOutlet weak var isDefaultLable: UILabel!
    
    
    // MARK: - Variables
    
    var cellIndex: Int = 0
    weak var delegate: AdressTablelViewProtocol?
    
    static let addressIDCell = "AddressesCell"
    static let height: CGFloat = 73
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func idDefaultButtonClicked(_ sender: UIButton) {
        
        delegate?.idDefaultButtonClicked(index: cellIndex)
        
    }
    
    func getupCell(getcll: AddressModel) {
        titleLable.text = getcll.titleAddress
        dateilsLable.text = getcll.datetisAddress
        
        
        if getcll.isDefault {
            isDefaultImage.image = UIImage(named: "isDeufult")
            isDefaultLable.textColor = UIColor(named: Colors.C0079FB.rawValue)
        } else {
            isDefaultImage.image = UIImage(named: "noDeuflut")
            isDefaultLable.textColor = UIColor(named: Colors.CBFBFBF.rawValue)
        }
        
    }
    
}
