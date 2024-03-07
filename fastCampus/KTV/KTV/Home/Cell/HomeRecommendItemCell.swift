//
//  HomeRecommendItemCell.swift
//  KTV
//
//  Created by  서재효 on 2024/03/06.
//

import UIKit

class HomeRecommendItemCell: UITableViewCell {
    static let height: CGFloat = 71
    static let identifier: String = "HomeRecommendItemCell"

    
    @IBOutlet weak var thumbnailContainerView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var playTimeBGView: UIView!
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var playTimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var imageTask: Task<Void, Never>?
    private static let timeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        
        return formatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.thumbnailImageView.layer.cornerRadius = 5
        self.rankLabel.layer.cornerRadius = 5
        self.rankLabel.clipsToBounds = true
        self.playTimeBGView.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
        self.thumbnailImageView.image = nil
        self.playTimeLabel.text = nil
        self.rankLabel.text = nil
    }
    
    func setData(_ data: Home.Recommend, rank: Int?) {
        self.rankLabel.text = data.title
        if let rank {
            self.rankLabel.text = "\(rank)"
        }
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.channel
        self.playTimeLabel.text = Self.timeFormatter.string(from: data.playTime)
        self.imageTask = .init{
            guard
                let responseData = try? await URLSession.shared.data(for: .init(url: data.imageUrl)).0
            else {
                return
            }
            
            self.thumbnailImageView.image = UIImage(data: responseData)
        }
    }
}
