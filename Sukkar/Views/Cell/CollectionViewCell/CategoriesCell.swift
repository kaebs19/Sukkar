//
//  CategoriesCell.swift
//  Sukkar
//
//  Created by mjeed on 10/12/2023.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        mainView.addRadius(radius: 16)
    }

}
