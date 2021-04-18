//
//  UITableViewCell+Extension.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 05.12.2020.
//

import Foundation
import UIKit

// MARK: - DequeueReusable methods
public extension UITableView {
    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: "\(Cell.self)", for: indexPath) as? Cell else {
            fatalError("register(cellClass:) has not been implemented")
        }
        return cell
    }

    func dequeueReusableHeaderFooterView<View: UITableViewHeaderFooterView>() -> View {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: "\(View.self)") as? View else {
            fatalError("register(aClass:) has not been implemented")
        }
        return view
    }
}

// MARK: - Register cell methods
public extension UITableView {
    func register(cellClass: AnyClass) {
        let nib = UINib(nibName: "\(cellClass)", bundle: Bundle(for: cellClass))
        register(nib, forCellReuseIdentifier: "\(cellClass)")
    }

    func register(aClass: AnyClass) {
        let nib = UINib(nibName: "\(aClass)", bundle: Bundle(for: aClass))
        register(nib, forHeaderFooterViewReuseIdentifier: "\(aClass)")
    }
}
