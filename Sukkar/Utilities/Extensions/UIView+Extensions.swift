//
//  UIView+Extensions.swift
//  Sukkar
//
//  Created by mjeed on 29/10/2023.
//

import UIKit


extension UIView {
    
    func addRadius(radius:CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func addBorder(borderColor: Colors , whithSize: CGFloat) {
        self.layer.borderColor = UIColor(named: borderColor.rawValue)?.cgColor
        self.layer.borderWidth = whithSize
    }
}
