//
//  CategoriesCell.swift
//  Sukkar
//
//  Created by mjeed on 15/12/2023.
//

import UIKit



class CategoriesCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        mainView.addRadius(radius: 20)
        mainView.addBorder(borderColor: .C0079FB, whithSize: 1)

    }

}
