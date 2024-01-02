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
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    // MARK: - Variables

    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()


    }
    
    // MARK: -  Configure Action - Func

    @IBAction func loginButtonClicked(_ sender: UIButton) {
     
        if validateLoginFields() {
            displayMessage(title: "Success", body: "login succcesfully", theme: .success)
            
        }
        
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}


// MARK: - extensions
extension LoginVC {
    
    func initUI() {
        for views in viewsRaduis {
            views.addRadius(radius: 7)
        }
        
        for buttons in [loginButton , resugsterButton] {
            buttons?.addRadius(radius: 7)
        }
        // add for border
        resugsterButton.addBorder(borderColor: Colors.C0079FB, whithSize: 1 )

    }
    
    func validateLoginFields() -> Bool {
        if emailTextField.text == "" {
            print("email is empty")
            displayMessage(title: "Warning", body: "email is empty", theme: .warning)
            return false

        }
        if passwordTextField.text == "" {
            print("password is empty")
            displayMessage(title: "Warning", body: "password is empty", theme: .error)
            return false

        }
        return false
    }
    
 
    
}
