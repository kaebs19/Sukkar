//
//  ProudectCell.swift
//  Sukkar
//
//  Created by mjeed on 15/12/2023.
//

import UIKit

class ProudectCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.addRadius(radius: 12)
        mainView.clipsToBounds = true
    }

}
