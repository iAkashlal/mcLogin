//
//  ViewController.swift
//  AKASHLAL.COM
//
//  Created by Akashlal on 10/11/19.
//  Copyright © 2019 Akashlal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, APIClientDelegate {
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var loginFormContainer: UIView!
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var token:String?
    let apiClient = APIClient()
    @IBOutlet weak var loaderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLoader()
        setupHideKeyboardOnTap()
        apiClient.delegate = self
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
        self.checkIfLoggedIn()
        hideNavigationBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar()
    }
    @IBAction func loginAction(_ sender: Any) {
        guard let ei = emailInput.text, let pw = passwordInput.text else {return}
        if ei == "" || pw == ""{
            self.presentAlert(title: "Alert!", alertMessage: "Please enter your id and password correctly")
        }
        else{
            apiClient.getTokenFor(emailId: ei, password: pw)
            showLoader()
        }
    }
    func checkIfLoggedIn(){
        let defaults = UserDefaults.standard
        self.token = defaults.string(forKey: "tokenKey")
        if self.token != ""{
            //Perform screen shift
            DispatchQueue.main.async{
                self.performSegue(withIdentifier: "loggedInSegue", sender: self)
            }
        }
    }
    
    //Delegate function called when login details are valid and login is successful
    func requestSuccessWithToken(token: String) {
        hideLoader()
        //Save Token
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "tokenKey")
        defaults.synchronize()
        //Update Token Variable
        self.token = token
        //Perform screen shift
        DispatchQueue.main.async{
            self.performSegue(withIdentifier: "loggedInSegue", sender: self)
        }
    }
    //Delegate function called when login is unsuccessful
    func requestFailed(errorMessage: String) {
        //Show error message on screen
        hideLoader()
        self.presentAlert(title: "Error!", alertMessage: errorMessage)
        
    }
    
    func showLoader(){
        DispatchQueue.main.async {
            self.loaderView.isHidden = false
        }
    }
    func hideLoader(){
        DispatchQueue.main.async {
            self.loaderView.isHidden = true
        }
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

