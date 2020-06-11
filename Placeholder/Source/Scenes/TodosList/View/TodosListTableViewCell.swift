//
//  TodosListTableViewCell.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 11/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//

import UIKit

class TodosListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkbox: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var deleteButton: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        applyStyle()
    }

    fileprivate func applyStyle() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    static var cellIdentifier: String {
        return String(describing: TodosListTableViewCell.self)
    }

    func updateUI(item: Todo) {
        title.text = item.title
     

    }

}
