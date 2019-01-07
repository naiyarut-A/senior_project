//
//  CustomFavoriteTableViewCell.swift
//  Test
//
//  Created by naiyarut on 6/1/2562 BE.
//  Copyright © 2562 tharueporn. All rights reserved.
//

import UIKit

class CustomFavoriteTableViewCell: UITableViewCell {
    @IBOutlet weak var logo_bank: UIImageView!
    @IBOutlet weak var type_acc: UILabel!
    @IBOutlet weak var rateperyear: UILabel!
    @IBOutlet weak var receive_interest: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
