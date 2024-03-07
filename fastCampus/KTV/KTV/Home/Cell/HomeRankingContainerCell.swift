//
//  HomeRankingContainerCell.swift
//  KTV
//
//  Created by  서재효 on 2024/03/07.
//

import UIKit

protocol HomeRankingContainerCellDelegate: AnyObject {
    func homeRankingContainerCell(_ cell: HomeRankingContainerCell, didSelectItemAt index: Int)
}

class HomeRankingContainerCell: UITableViewCell {
    
    
    static let identifier: String = "HomeRankingContainerCell"
    static let height: CGFloat = 349
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: HomeRankingContainerCellDelegate?
    private var rankings: [Home.Ranking]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(
            UINib(nibName: HomeRankingItemCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: HomeRankingItemCell.identifier
        )
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ data: [Home.Ranking]) {
        self.rankings = data
        self.collectionView.reloadData()
    }
}

extension HomeRankingContainerCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.rankings?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeRankingItemCell.identifier,
            for: indexPath
        )
        
        if let cell = cell as? HomeRankingItemCell,
           let data = self.rankings?[indexPath.item] {
            cell.setRank(data, rank: indexPath.item + 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.homeRankingContainerCell(self, didSelectItemAt: indexPath.item)
    }
    
}
