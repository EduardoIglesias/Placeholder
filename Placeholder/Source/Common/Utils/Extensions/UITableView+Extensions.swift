//
//  UITableView+Extensions.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 12/06/2020.
//  Copyright © 2020 Rindus. All rights reserved.
//

import UIKit

public extension UITableView {
    func register<T: UITableViewCell> (_ type: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.nibName)
    }

    func dequeueReusableCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.nibName) as? T else {
            fatalError("\(T.nibName) could not be dequeued as \(T.self)")
        }

        return cell
    }

    func reloadData(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() }, completion: { _ in completion() })
    }
}
