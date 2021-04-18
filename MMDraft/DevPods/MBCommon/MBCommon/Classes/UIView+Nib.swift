//
//  UIView+Nib.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

public protocol NibLoadableProtocol: class {
    static var nib: UINib { get }
    static var nibName: String { get }
    
    static func loadFromNib() -> Self?
}

public extension NibLoadableProtocol {
    static var nibName: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}

public extension NibLoadableProtocol where Self: UIView {
    static func loadFromNib() -> Self? {
        return nib.instantiate(withOwner: nil, options: nil).first as? Self
    }
}

public extension NibLoadableProtocol where Self: UIViewController {
    @discardableResult
    static func loadFromNib() -> Self? {
        return self.init(nibName: nibName, bundle: Bundle(for: self))
    }
}

public protocol UniqNibLoadableProtocol: class {
    static var uniqNibName: String { get }
    static var uniqNib: UINib { get }
}

extension UIView: NibLoadableProtocol {}
extension UIViewController: NibLoadableProtocol {}
