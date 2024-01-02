//
//  UIViewControllers+Extension.swift
//  Sukkar
//
//  Created by mjeed on 29/12/2023.
//

import UIKit
import SwiftMessages

extension UIViewController {
    func displayMessage(title: String , body: String , theme:Theme   ) {
        
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(theme)
        view.configureDropShadow()
        let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
        view.configureContent(title:title, body:body, iconText: iconText)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        view.button?.isHidden = true
        SwiftMessages.show(view: view)
        
    }
}
