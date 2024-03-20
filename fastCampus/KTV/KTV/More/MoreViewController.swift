//
//  MoreViewController.swift
//  KTV
//
//  Created by  서재효 on 3/14/24.
//

import UIKit

class MoreViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = MoreViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 48
        self.tableView.register(
            UINib(nibName: MoreTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: MoreTableViewCell.identifier
        )
        self.setupConerRadius()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupConerRadius()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        
        coordinator.animate { _ in
            self.setupConerRadius()
        }
        
        
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    

    @IBAction func closeDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func setupConerRadius() {
        let path = UIBezierPath(
            roundedRect: self.headerView.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 13, height: 13)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        self.headerView.layer.mask = maskLayer
    }
    
}


extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MoreTableViewCell.identifier,
            for: indexPath
        )
        
        if let cell = cell as? MoreTableViewCell {
            cell.setItem(self.viewModel.items[indexPath.row], separatorHidden: indexPath.row + 1 == self.viewModel.items.count)
        }
        
        return cell
    }
    
    
}
