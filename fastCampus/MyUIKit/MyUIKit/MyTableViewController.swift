//
//  MyTableViewController.swift
//  MyUIKit
//
//  Created by  서재효 on 2024/02/21.
//

import UIKit

class MyTableViewController: UIViewController{

    @IBOutlet weak var myTableView: UITableView!
    
    let cellData = ["Hello TableView!", "This is UIKit", "Welcome!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.backgroundColor = .systemTeal
        myTableView.delegate = self
        myTableView.dataSource = self
    }
   
}

extension MyTableViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = cellData[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }else {
            return 60.0
        }
    }
}
