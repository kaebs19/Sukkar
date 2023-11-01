//
//  RegisterVC.swift
//  Sukkar
//
//  Created by mjeed on 31/10/2023.
//

import UIKit

class RegisterVC: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet  var  cornerRudisViews: [UIView]!
    @IBOutlet weak var  registerButton: UIButton!
    @IBOutlet weak var igreeImageView: UIImageView!
    
    // MARK: - Variables

    // check for image
    var igree:Bool = false
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // add corner rudis all views
        for views in cornerRudisViews {
            views.addRadius(radius: 7)
        }
        
        // add corner rudis button
        registerButton.addRadius(radius: 7)
        
    }
    
    // MARK: -  Configure Action - Func

    @IBAction func iAgreeButton(_ sender: UIButton) {
        
        igree.toggle()
        
        igreeImageView.image = UIImage(named: igree ? "check_sel" : "check_unsel_sel")
        
    }
    
    
    @IBAction func backHome(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
