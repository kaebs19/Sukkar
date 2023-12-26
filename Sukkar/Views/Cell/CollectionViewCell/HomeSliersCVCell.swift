//
//  HomeSliersCVCell.swift
//  Sukkar
//
//  Created by mjeed on 18/12/2023.
//

import UIKit

class HomeSliersCVCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak var sliersImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(_ sliersImage: UIImage){
        sliersImageView.image = sliersImage
    }

}
