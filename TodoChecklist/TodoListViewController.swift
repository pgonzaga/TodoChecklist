//
//  ViewController.swift
//  TodoChecklist
//
//  Created by Pablo Gonzaga on 4/15/18.
//  Copyright © 2018 Pablo Gonzaga. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var items: [String] = []
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if let todos = defaults.array(forKey: "TodoList") as? [String] {
            items = todos
        }
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

    //MARK Add new item button

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        var textField: UITextField = UITextField()

        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            self.items.append(textField.text!)
            self.defaults.set(self.items, forKey: "TodoList")

            self.tableView.reloadData()
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

