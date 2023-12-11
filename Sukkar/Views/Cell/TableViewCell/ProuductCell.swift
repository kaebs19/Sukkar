//
//  ProuductCell.swift
//  Sukkar
//
//  Created by mjeed on 27/11/2023.
//

import UIKit


protocol ProuductProtocol: AnyObject {
    func isFavClickedButton(_ index: Int)
}


class ProuductCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var isFavoriteButton: UIButton!
    
    // MARK: - Variables
    
    static let height:CGFloat = 273
    static let idCell:String = "ProuductCell"
    
    var index:Int = 0
    weak var deleaget: ProuductProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.addRadius(radius: 18)
        
    }
    
    // MARK: -  Configure Action - Func
    
    @IBAction func isFavClickedButton(_ sender: UIButton) {
        
        deleaget?.isFavClickedButton(index)
        
    }
    
    func getupDaata(data:Products) {
        titleLable.text = data.title
        priceLable.text = data.pricc
        
        if data.isFav == true {
            isFavoriteButton.setImage(UIImage(named: "star_sel"), for: .normal)
        } else {
            isFavoriteButton.setImage(UIImage(named: "star_unsel"), for: .normal)
        }
    }
    
}


