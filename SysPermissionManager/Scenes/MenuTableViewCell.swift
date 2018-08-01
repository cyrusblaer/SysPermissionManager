//
//  MenuTableViewCell.swift
//  SysPermissionTest
//
//  Created by Blaer on 2018/7/30.
//  Copyright © 2018 curusblaer. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            self.titleLabel.text = title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
