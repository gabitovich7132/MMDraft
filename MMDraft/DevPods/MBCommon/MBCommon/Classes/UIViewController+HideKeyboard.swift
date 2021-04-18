//
//  UIViewController+HideKeyboard.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

extension UIViewController {
     public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }
}
