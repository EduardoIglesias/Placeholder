//
//  TodosListTableViewCell.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 11/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//

import UIKit

class TodosListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
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

    func updateUI(index: Int, item: Todo) {
        title.text = item.title
        checkboxButton.isSelected = item.completed
        checkboxButton.tag = index
        deleteButton.tag = index
    }

}
