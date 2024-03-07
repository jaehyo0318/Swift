//
//  HomeViewCell.swift
//  KTV
//
//  Created by  서재효 on 2024/03/05.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    static let height:CGFloat = 320
    static let identifier: String = "HomeViewCell"
    

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var hotImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var channelTItleLabel: UILabel!
    @IBOutlet weak var channelSubtitleLabel: UILabel!
    
    private var thumbnailTask: Task<Void, Never>?
    private var channelThumbnailTask: Task<Void, Never>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.thumbnailTask?.cancel()
        self.thumbnailTask = nil
        self.channelThumbnailTask?.cancel()
        self.channelThumbnailTask = nil
        
        self.thumbnailImageView.image = nil
        self.titleLabel.text = nil
        self.subtitleLabel.text = nil
        self.channelTItleLabel.text = nil
        self.channelImageView.image = nil
        self.channelSubtitleLabel.text = nil
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(_ data: Home.Video) {
        self.titleLabel.text = data.title
        self.subtitleLabel.text = data.subtitle
        self.channelTItleLabel.text = data.channel
        self.channelSubtitleLabel.text = data.channelDescription
        self.hotImageView.isHidden = !data.isHot
        self.thumbnailTask = self.thumbnailImageView.loadImage(url: data.imageUrl)
        self.channelThumbnailTask = self.channelImageView.loadImage(url: data.channelThumbnailImageUrl)
    }
}

