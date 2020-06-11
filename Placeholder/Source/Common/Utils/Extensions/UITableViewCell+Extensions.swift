//
//  UITableViewCell+Extensions.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 12/06/2020.
//  Copyright © 2020 Rindus. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}
