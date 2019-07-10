//
//  NewsListCell.swift
//  ViperDemoProject
//
//  Created by Yildirim Atcioglu on 9.07.2019.
//  Copyright © 2019 Yildirim Atcioglu. All rights reserved.
//

import UIKit

class NewsListCell: UITableViewCell {
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
