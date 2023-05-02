//
//  RankViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/05/02.
//

import UIKit
import SQLite3


class RankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var dbHelper = DBHelper.shared
    var name = ["1","2","3"]
    var record = ["123","456"]
    var dataArray: [MyModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        dataArray = dbHelper.readData()
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankTableViewCell
        
//        cell.nameLabel.text = name[indexPath.row]
//        cell.recordLabel.text = record[indexPath.row]
        cell.nameLabel.text = String(dataArray[indexPath.row].myName)
        cell.recordLabel.text = String(dataArray[indexPath.row].myName)
        if let age = dataArray[indexPath.row].myAge {
            cell.recordLabel.text = String(age)
        }
        
        
        return cell
    }

}
