//
//  CompaniesTableViewController.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 08/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import UIKit

class ListCompaniesTableViewController: UITableViewController {

    let viewModel = ListCompaniesViewModel()
    
    @IBOutlet private weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.addButton.accessibilityIdentifier = "addCompanyButton"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.isEmpty {
            return 1
        }
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if viewModel.isEmpty {
            return false
        }
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete, !viewModel.isEmpty {
            if viewModel.removeCompany(at: indexPath.row) {
                tableView.reloadSections(IndexSet(integer: 0), with: .fade)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyStateCell", for: indexPath)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath) as! CompanyCell
        let company = viewModel.getCompany(at: indexPath.row)
        cell.data = company
        cell.initialsColor = UIColor(named: indexPath.row % 2 == 0 ? "Purple" : "Orange")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            viewModel.prepare(for: segue, at: indexPath.row)
        }
    }
}
