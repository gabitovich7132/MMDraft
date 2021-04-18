//
//  AlertRoutable.swift
//  MBCommonUI
//
//  Created by Zhenis Mutan on 10/28/20.
//

import UIKit

public protocol AlertRoutableProtocol: PresentableProtocol {
    typealias AlertTextFieldHandler = (UITextField) -> Void
    
    func showAlert(title: String, message: String)
}

extension AlertRoutableProtocol {
    public func showAlert(title: String, message: String) {
        guard let source = toPresent() else {
            return
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.accessibilityIdentifier = "alert-controller_alert_view"
        let completeAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(completeAction)
        source.present(alertController, animated: true, completion: nil)
    }
}
