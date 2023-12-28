//
//  AddressCVCell.swift
//  Sukkar
//
//  Created by mjeed on 28/12/2023.
//

import UIKit

class AddressCVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.addRadius(radius: 17)
        mainView.addBorder(borderColor: .C0079FB, whithSize: 1)
    }

}
