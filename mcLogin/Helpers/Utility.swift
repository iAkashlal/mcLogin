//
//  Utility.swift
//  PingAR
//
//  Created by Akashlal Bathe on 07/10/19.
//  Copyright © 2019 Akashlal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    //To hide Navigation bar now and in subsequent screens
    func hideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    //To show Navigation bar now and in subsequent screens
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //To Hide Keyboard - https://stackoverflow.com/a/48461993/6212513
    ///Call this once in ViewDidLoad to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    /// Helper function to dismiss the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
    
    
    
    //To lift full view when keyboard is active - https://stackoverflow.com/a/31124676/6212513
    func setupFullViewLiftWhenKeyboardShows(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //Helper functions to lift and drop views
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                        if self.view.frame.origin.y == 0 {
                            self.view.frame.origin.y -= keyboardSize.height
                        }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
                if self.view.frame.origin.y != 0 {
                    self.view.frame.origin.y = 0
                }
    }
}

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
//    static var backgroundColor1: UIColor {
//        if #available(iOS 13.0, *) {
//            return UIColor { (traits) -> UIColor in
//                // Return one of two colors depending on light or dark mode
//                return traits.userInterfaceStyle == .dark ?
//                    UIColor.init(rgb: 0x000000) :
//                    UIColor.init(rgb: 0xeeeeee)
//            }
//        } else {
//            // Same old color used for iOS 12 and earlier
//            return UIColor.init(rgb: 0xeeeeee)
//        }
//    }
//    static var textFieldColor: UIColor {
//        if #available(iOS 13.0, *) {
//            return UIColor { (traits) -> UIColor in
//                // Return one of two colors depending on light or dark mode
//                return traits.userInterfaceStyle == .dark ?
//                    UIColor.init(rgb: 0x222831) :
//                    UIColor.init(rgb: 0xffffff)
//            }
//        } else {
//            // Same old color used for iOS 12 and earlier
//            return UIColor.init(rgb: 0xffffff)
//        }
//    }
//    static var basicTextColor: UIColor {
//        if #available(iOS 13.0, *) {
//            return UIColor { (traits) -> UIColor in
//                // Return one of two colors depending on light or dark mode
//                return traits.userInterfaceStyle == .dark ?
//                    UIColor.init(rgb: 0xffffff) :
//                    UIColor.init(rgb: 0x393e46)
//            }
//        } else {
//            // Same old color used for iOS 12 and earlier
//            return UIColor.init(rgb: 0x393e46)
//        }
//    }
//0x222831
}
