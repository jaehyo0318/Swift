//
//  LiveCell.swift
//  KTV
//
//  Created by  서재효 on 3/19/24.
//

import UIKit

class LiveCell: UICollectionViewCell {

    static let height: CGFloat = 76
    static let identifier: String = "LiveCell"
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var liveLabel: UILabel!
    private var imageTask: Task<Void, Never>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.liveLabel.layer.cornerRadius = 5
        self.liveLabel.clipsToBounds = true
        self.imageView.layer.cornerRadius = 5
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageTask?.cancel()
        self.imageTask = nil
        self.imageView.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
    
    func setData(_ data: Live.Item) {
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.channel
        self.imageTask = self.imageView.loadImage(url: data.thumbnailUrl)
    }

}
