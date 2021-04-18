//
//  UIView+Nib.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 10/27/20.
//

import UIKit

public extension UIView {
    func loadFromNib(_ bundle: Bundle? = Bundle.main) {
            let className = String(describing: type(of: self))
            guard let view = bundle?.loadNibNamed(className,
                                                  owner: self,
                                                  options: nil)?.first as? UIView else {
                                                    fatalError("No xib file found for UIView object: \(self)")
            }
            
            view.frame = bounds
            addSubview(view)
    }
}
