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
    
    var token:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    @IBAction func loginAction(_ sender: Any) {
        self.token = "abcdef"
        performSegue(withIdentifier: "loggedInSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loggedInSegue"{
            let dashboardVC = segue.destination as! DashboardViewController
            //If a token was successfully obtained, it opens https://mckinleyrice.com?token=obtainedToken, else opens google.com (since variable default value is google.com in next screen)
            if let token = token{
                dashboardVC.urlStr = "https://mckinleyrice.com?token=\(token)"
            }
        }
    }
}

