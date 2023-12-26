//
//  HomeCategoriesCVCell.swift
//  Sukkar
//
//  Created by mjeed on 18/12/2023.
//

import UIKit

class HomeCategoriesCVCell: UICollectionViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.clipsToBounds = true
        mainView.addRadius(radius: 12)
    }

}
