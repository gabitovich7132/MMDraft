//
//  ViewControllerProtocol.swift
//  MBCommonUI
//
//  Created by Zhenis Mutan on 23.11.2020.
//

import UIKit

public protocol ViewControllerProtocol: UIViewController { }
extension UIViewController: PresentableProtocol {
    public func toPresent() -> UIViewController? {
        return self
    }
}
