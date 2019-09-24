//
//  ViewController.swift
//  DuplicatedRepeatingCellsUI
//
//  Created by Kairat on 9/24/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    let cellID = "scellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
        setupView()
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: view.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ].forEach { $0.isActive = true }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        cell.delegate = self
        if indexPath.row == 0 {
            cell.textImage.image = UIImage(named: "1")
        } else if indexPath.row == 1 {
            cell.textImage.image = UIImage(named: "3")
        } else if indexPath.row == 2 {
            cell.textImage.image = UIImage(named: "2")
        } else if indexPath.row == 25 {
            cell.textImage.image = UIImage(named: "7")
        }
        return cell
    }
}

extension ViewController: ReloadDataDelagate {
    func reloadData() {
        self.tableView.reloadData()
    }
}
