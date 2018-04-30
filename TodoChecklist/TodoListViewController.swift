//
//  ViewController.swift
//  TodoChecklist
//
//  Created by Pablo Gonzaga on 4/15/18.
//  Copyright © 2018 Pablo Gonzaga. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var items: [Item] = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK TableView Data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name

        if items[indexPath.row].done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    //MARK TableView delegate methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        items[indexPath.row].done = !items[indexPath.row].done

        let selectedItem = items[indexPath.row]

        if selectedItem.done {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }

    }

    //MARK Add new item button

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        var textField: UITextField = UITextField()

        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            let newItem = Item(nameData: textField.text!, doneStatus: false)
            self.items.append(newItem)
            let encoder = PropertyListEncoder()
            do {
                let data = try encoder.encode(self.items)
                try data.write(to: self.dataFilePath!)
            } catch {
                print("Error encoding file")
            }


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

