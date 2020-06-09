//
//  UIView+Extensions.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 07/06/2020.
//  Copyright © 2020 Rindus. All rights reserved.
//

import UIKit

public extension UIView {

    func xibSetup() {
      let view = loadViewFromNib()
      view.frame = bounds
      view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
      addSubview(view)
    }

    func loadViewFromNib() -> UIView {
      let bundle = Bundle(for: type(of: self))
      let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
      if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
        return view
      }
      return UIView()
    }

}


