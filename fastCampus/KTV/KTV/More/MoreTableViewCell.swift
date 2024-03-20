//
//  MoreTableViewCell.swift
//  KTV
//
//  Created by  서재효 on 3/14/24.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    static let identifier: String = "MoreTableViewCell"
    
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.descriptionLabel.text = nil
        self.titleLabel.text = nil
    }

    func setItem(_ item: MoreItem, separatorHidden: Bool) {
        self.titleLabel.text = item.title
        self.descriptionLabel.text = item.rightText
        self.separatorView.isHidden = separatorHidden
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
}
