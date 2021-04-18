//
//  ViewOutputProtocol.swift
//  MBCommonUI
//
//  Created by Zhenis Mutan on 23.11.2020.
//

import UIKit

public protocol ViewOutputProtocol: class {
    func viewDidLoad()
    
    func didGoBack()
    func didClose()
    func didGoBackOrClose()
    func didRemove()
}
