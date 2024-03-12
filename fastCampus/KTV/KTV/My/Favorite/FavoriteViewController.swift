//
//  FavoriteViewController.swift
//  KTV
//
//  Created by  서재효 on 3/12/24.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel: FavoriteViewModel = .init()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: HomeRecommendItemCell.identifier, bundle: nil), forCellReuseIdentifier: HomeRecommendItemCell.identifier)
        
        self.viewModel.dataChanged = { [weak self] in
            self?.tableView.reloadData()
        }
        self.viewModel.request()
    }

}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.favorite?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeRecommendItemCell.identifier,
            for: indexPath
        )
        
        if let cell = cell as? HomeRecommendItemCell,
           let data = self.viewModel.favorite?.list[indexPath.row] {
            cell.setData(data, rank:nil)
            cell.setLeading(21)
        }
        
        return cell
    }
    
    
}
