//
//  ViewController.swift
//  PingAR
//
//  Created by Akashlal on 28/09/19.
//  Copyright © 2019 Akashlal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var loginFormContainer: UIView!
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.backgroundColor1
//        emailInput.backgroundColor = UIColor.textFieldColor
//        passwordInput.backgroundColor = UIColor.textFieldColor
//        usernameLabel.textColor = UIColor.basicTextColor
//        passwordLabel.textColor = UIColor.basicTextColor
//        emailInput.textColor = UIColor.basicTextColor
//        passwordInput.textColor = UIColor.basicTextColor
        //Initialize
        setupHideKeyboardOnTap()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.loginFormContainer.alpha = 0
        self.baseView.frame = CGRect(x: UIScreen.main.bounds.width - self.baseView.bounds.width , y: self.view.frame.size.height/3.2, width: self.baseView.frame.size.width, height: self.baseView.frame.size.height) 
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseIn, animations: {
            self.baseView.frame = CGRect(x: UIScreen.main.bounds.width - self.baseView.bounds.width, y:  UIScreen.main.bounds.height - self.view.frame.size.height, width: self.baseView.frame.size.width, height: self.baseView.frame.size.height)
            
        }) { (finished) in
            //Displaying Login buttons
            UIView.animate(withDuration: 0.5, animations: {
                self.loginFormContainer.alpha = 1
//                self.emailInput.layer.cornerRadius = self.emailInput.frame.size.height/2
//                self.emailInput.clipsToBounds = true
//                self.emailInput.layer.borderWidth = 1.0
//                self.emailInput.layer.borderColor = UIColor.lightGray.cgColor
//                self.passwordInput.layer.cornerRadius = self.emailInput.frame.size.height/2
//                self.passwordInput.clipsToBounds = true
//                self.passwordInput.layer.borderWidth = 1.0
//                self.passwordInput.layer.borderColor = UIColor.lightGray.cgColor
            })
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideNavigationBar()
    }
}

