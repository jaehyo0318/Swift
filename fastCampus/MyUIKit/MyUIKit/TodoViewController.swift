//
//  TodoViewController.swift
//  MyUIKit
//
//  Created by  서재효 on 2024/02/21.
//

import UIKit

struct TodoItem {
    let title: String
    var isCompleted: Bool
}

class TodoViewController: UIViewController {
//    todoCell

    @IBOutlet weak var todoTableView: UITableView!
    
    var data: [TodoItem] = [
        TodoItem(title: "커밋하기", isCompleted: false),
        TodoItem(title: "운동하기", isCompleted: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        todoTableView.backgroundColor = .systemPink
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
    }

}

extension TodoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myAction = UIContextualAction(style: .normal, title: "완료") { action, view, completionHandler in
            self.data[indexPath.row].isCompleted.toggle()
            self.todoTableView.reloadData()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [myAction])
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        
        if data[indexPath.row].isCompleted {
            cell.textLabel?.textColor = .green
        } else {
            cell.textLabel?.textColor = .red
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoTableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    
}
