//
//  ViewController.swift
//  Sukkar
//
//  Created by mjeed on 26/10/2023.
//

import UIKit

class LoginVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet var viewsRaduis:[UIView]!
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var resugsterButton:UIButton!

    // MARK: - Variables

    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        for views in viewsRaduis {
            views.addRadius(radius: 7)
        }
        
        for buttons in [loginButton , resugsterButton] {
            buttons?.addRadius(radius: 7)
        }
        // add for border
        resugsterButton.addBorder(borderColor: Colors.C0079FB, whithSize: 1 )
        
        // MARK: -  Configure Action - Func


    }


}


