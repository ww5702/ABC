//
//  RankViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/05/02.
//

import UIKit
import SQLite3


class RankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalTableView: UITableView!
    @IBOutlet weak var myTableView: UITableView!
    
    var dbHelper = DBHelper.shared
    var dataArray: [MyModel] = []
    var columnCount: Int = 1
    
    @IBOutlet weak var backTableBtn: UIBarButtonItem!
    @IBOutlet weak var nextTableBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Reaction Ranking"
        totalTableView.delegate = self
        totalTableView.dataSource = self
        // 개인 랭킹
        
        dataArray = dbHelper.readData(section: "reaction")
        totalTableView.reloadData()
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
        if let reaction = dataArray[indexPath.row].section {
            cell.recordLabel.text = String(reaction)
        }
        
        
        return cell
    }
    func reload() {
        totalTableView.reloadData()
    }
    
    
    @IBAction func backTableBtn(_ sender: UIBarButtonItem) {
        columnCount -= 1
        if columnCount == 0 {
            columnCount = 7
        }
        switch columnCount {
        case 1:
            titleLabel.text = "Reaction Ranking"
            dataArray = dbHelper.readData(section: "reaction")
            break
        case 2:
            titleLabel.text = "Verbal Ranking"
            dataArray = dbHelper.readData(section: "verbal")
            break
        case 3:
            titleLabel.text = "Visual Ranking"
            dataArray = dbHelper.readData(section: "visual")
            break
        case 4:
            titleLabel.text = "Number Ranking"
            dataArray = dbHelper.readData(section: "number")
            break
        case 5:
            titleLabel.text = "Aim Ranking"
            dataArray = dbHelper.readData(section: "aim")
            break
        case 6:
            titleLabel.text = "Chimp Ranking"
            dataArray = dbHelper.readData(section: "chimp")
            break
        case 7:
            titleLabel.text = "Sequence Ranking"
            dataArray = dbHelper.readData(section: "sequence")
            break
        default:
            break
        }
       
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankTableViewCell
            
            cell.nameLabel.text = String(dataArray[indexPath.row].myName)
            cell.recordLabel.text = String(dataArray[indexPath.row].myName)
            if let section = dataArray[indexPath.row].section {
                cell.recordLabel.text = String(section)
            }
            return cell
        }
        reload()
    }
    @IBAction func nextTableBtn(_ sender: UIBarButtonItem) {
        columnCount += 1
        if columnCount == 8 {
            columnCount = 1
        }
        
        switch columnCount {
        case 1:
            titleLabel.text = "Reaction Ranking"
            dataArray = dbHelper.readData(section: "reaction")
            break
        case 2:
            titleLabel.text = "Verbal Ranking"
            dataArray = dbHelper.readData(section: "verbal")
            break
        case 3:
            titleLabel.text = "Visual Ranking"
            dataArray = dbHelper.readData(section: "visual")
            break
        case 4:
            titleLabel.text = "Number Ranking"
            dataArray = dbHelper.readData(section: "number")
            break
        case 5:
            titleLabel.text = "Aim Ranking"
            dataArray = dbHelper.readData(section: "aim")
            break
        case 6:
            titleLabel.text = "Chimp Ranking"
            dataArray = dbHelper.readData(section: "chimp")
            break
        case 7:
            titleLabel.text = "Sequence Ranking"
            dataArray = dbHelper.readData(section: "sequence")
            break
        default:
            break
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankTableViewCell
            
            cell.nameLabel.text = String(dataArray[indexPath.row].myName)
            cell.recordLabel.text = String(dataArray[indexPath.row].myName)
            if let section = dataArray[indexPath.row].section {
                cell.recordLabel.text = String(section)
            }
            return cell
        }
        reload()
    }
    
}
