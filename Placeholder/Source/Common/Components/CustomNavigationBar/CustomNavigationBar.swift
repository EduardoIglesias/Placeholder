//
//  CustomNavigationBar.swift
//  Iberdrola
//
//  Created by Antonio Romero on 24/1/19.
//  Copyright © 2019 Iberdrola. All rights reserved.
//

import UIKit

@objc protocol CustomNavigationBarDelegate: class {
    func backButtonAction()
    @objc optional func rightButtonAction()
}

struct NavigationBarData {
    let title: String
    let backTitle: String
    let iconImage: UIImage?
    let rightButtonImage: UIImage?
}

@IBDesignable class CustomNavigationBar: UIView {

    @objc weak var delegate: CustomNavigationBarDelegate?

    // MARK: - Outlets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var backTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupView()
        //fixTopConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setupView()
        //fixTopConstraint()
    }

    func fixTopConstraint() {
        if #available(iOS 11.0, *) {} else {
            let statusBarHeight = UIApplication.shared.statusBarFrame.height
            topConstraint.constant += statusBarHeight
        }
    }

    // MARK: - Event Handler
    @IBAction func backButtonAction(_ sender: Any) {
        delegate?.backButtonAction()
    }

    @IBAction func rightButtonAction(_ sender: Any) {
        delegate?.rightButtonAction?()
    }

    @objc func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(backButtonAction(_:)))
        backTitleLabel.addGestureRecognizer(tap)
        backTitleLabel.font = UIFont.bodyBase
        backTitleLabel.textColor = UIColor.grey

        let templateImage = #imageLiteral(resourceName: "chevronLeftIcon").withRenderingMode(.alwaysTemplate)
        backButton.setImage(templateImage, for: .normal)
        backButton.tintColor = UIColor.grey

        titleLabel.textColor = UIColor.darkgrey
        titleLabel.font = UIFont.headers
    }

    func updateUI(data: NavigationBarData, isModal: Bool = false) {
        titleLabel.text = data.title
        backTitleLabel.text = data.backTitle
        rightButton.isHidden = true

        if let image = data.rightButtonImage {
            rightButton.setImage(image, for: .normal)
            rightButton.isHidden = false
        }

        backTitleLabel.isHidden = isModal
        backButton.isHidden = isModal
    }
}
