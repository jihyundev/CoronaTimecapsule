//
//  FinishedListCell.swift
//  TimeCapsule
//
//  Created by 정지현 on 2021/03/12.
//

import UIKit

class FinishedListCell: UITableViewCell {
    
    let cellID = "FinishedListCell"

    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var stoneImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var wishLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = #colorLiteral(red: 0.4756628871, green: 0.3672500849, blue: 0.8775171638, alpha: 1)
        mainBackgroundView.layer.cornerRadius = 8
        mainBackgroundView.layer.borderColor = UIColor.black.cgColor
        mainBackgroundView.layer.borderWidth = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
