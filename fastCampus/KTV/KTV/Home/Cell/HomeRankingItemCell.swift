//
//  HomeRankingItemCell.swift
//  KTV
//
//  Created by  서재효 on 2024/03/07.
//

import UIKit

class HomeRankingItemCell: UICollectionViewCell {
    static let identifier: String = "HomeRankingItemCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
        
    private var imageTask: Task<Void, Never>?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.numberLabel.text = nil
        self.thumbnailImageView.image = nil
        self.imageTask?.cancel()
        self.imageTask = nil
    }
    
    func setRank(_ data: Home.Ranking, rank: Int) {
        self.numberLabel.text = "\(rank)"
        self.imageTask = .init(
            operation: {
                guard
                    let responseData = try? await URLSession.shared.data(for: .init(url: data.imageUrl)).0
                else {
                    return
                }
                
                self.thumbnailImageView.image = UIImage(data: responseData)
            }
        )
    }
}
