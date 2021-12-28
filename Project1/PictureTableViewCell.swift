//
//  PictureTableViewCell.swift
//  Project1
//
//  Created by ruanjianyingyongbu on 2021/12/23.
//

import UIKit

class PictureTableViewCell: UITableViewCell {
    
    @IBOutlet var picture: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
