//
//  ViewController.swift
//  TodoChecklist
//
//  Created by Pablo Gonzaga on 4/15/18.
//  Copyright © 2018 Pablo Gonzaga. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var items: [String] = ["test1", "test2"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK TableView Data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    //MARK TableView delegate methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

    }
}

