//
//  BookmarkViewController.swift
//  KTV
//
//  Created by  서재효 on 3/12/24.
//

import UIKit

class BookmarkViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel: BookmarkViewModel = .init()
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(
            UINib(nibName: BookmarkCell.identifier, bundle: nil),
            forCellReuseIdentifier: BookmarkCell.identifier
        )
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.viewModel.dataChanged = { [weak self] in
            self?.tableView.reloadData()
        }
        self.viewModel.request()
    }

}

extension BookmarkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.channels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: BookmarkCell.identifier,
            for: indexPath)
        
        if let cell = cell as? BookmarkCell,
           let data = self.viewModel.channels?[indexPath.row] {
            cell.setData(data)
            
        }
        
        return cell
    }
    
}
