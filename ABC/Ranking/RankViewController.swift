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
    var mydataArray: [MymyModel] = []
    var userName: String?
    
    var columnCount: Int = 1
    
    @IBOutlet weak var backTableBtn: UIBarButtonItem!
    @IBOutlet weak var nextTableBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        titleLabel.text = "Reaction Ranking"
        totalTableView.delegate = self
        totalTableView.dataSource = self
        // 개인 랭킹
        myTableView.delegate = self
        myTableView.dataSource = self
        
        print(userName!)
        dataArray = dbHelper.readData(section: "reaction")
        mydataArray = dbHelper.readMyData(name: userName!, section: "reaction")
        
        //print(dataArray)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == totalTableView {
            return dataArray.count
        }
        if tableView == myTableView {
            return mydataArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankTableViewCell
        
        if tableView == totalTableView {
            cell.nameLabel.text = String(dataArray[indexPath.row].myName)
            cell.recordLabel.text = String(dataArray[indexPath.row].myName)
            if let reaction = dataArray[indexPath.row].section {
                cell.recordLabel.text = String(reaction)
            }
            return cell
        } else if tableView == myTableView {
            cell.mynameLabel.text = String(mydataArray[0].myName)
            cell.myrecordLabel.text = String(mydataArray[0].myName)
            if let reaction = mydataArray[0].section {
                cell.myrecordLabel.text = String(reaction)
            }
            return cell
        }
        return cell
        
    }
    func reload() {
//        totalTableView.reloadSections(IndexSet(0...dataArray.count-1), with: UITableView.RowAnimation.automatic)
//        myTableView.reloadSections(IndexSet(0...mydataArray.count-1), with: UITableView.RowAnimation.automatic)
        totalTableView.reloadData()
        myTableView.reloadData()
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
            mydataArray = dbHelper.readMyData(name: userName!, section: "reaction")
            break
        case 2:
            titleLabel.text = "Verbal Ranking"
            dataArray = dbHelper.readData(section: "verbal")
            mydataArray = dbHelper.readMyData(name: userName!, section: "verbal")
            break
        case 3:
            titleLabel.text = "Visual Ranking"
            dataArray = dbHelper.readData(section: "visual")
            mydataArray = dbHelper.readMyData(name: userName!, section: "visual")
            break
        case 4:
            titleLabel.text = "Number Ranking"
            dataArray = dbHelper.readData(section: "number")
            mydataArray = dbHelper.readMyData(name: userName!, section: "number")
            break
        case 5:
            titleLabel.text = "Aim Ranking"
            dataArray = dbHelper.readData(section: "aim")
            mydataArray = dbHelper.readMyData(name: userName!, section: "aim")
            break
        case 6:
            titleLabel.text = "Chimp Ranking"
            dataArray = dbHelper.readData(section: "chimp")
            mydataArray = dbHelper.readMyData(name: userName!, section: "chimp")
            break
        case 7:
            titleLabel.text = "Sequence Ranking"
            dataArray = dbHelper.readData(section: "sequence")
            mydataArray = dbHelper.readMyData(name: userName!, section: "sequence")
            break
        default:
            break
        }
       print(mydataArray)
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankTableViewCell

            if tableView == totalTableView {
                cell.nameLabel.text = String(dataArray[indexPath.row].myName)
                cell.recordLabel.text = String(dataArray[indexPath.row].myName)
                if let section = dataArray[indexPath.row].section {
                    cell.recordLabel.text = String(section)
                }
                return cell
            } else if tableView == myTableView {
                cell.mynameLabel.text = String(mydataArray[0].myName)
                cell.myrecordLabel.text = String(mydataArray[0].myName)
                if let section = mydataArray[0].section {
                    cell.myrecordLabel.text = String(section)
                }
                return cell
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
            mydataArray = dbHelper.readMyData(name: userName!, section: "reaction")
            break
        case 2:
            titleLabel.text = "Verbal Ranking"
            dataArray = dbHelper.readData(section: "verbal")
            mydataArray = dbHelper.readMyData(name: userName!, section: "verbal")
            break
        case 3:
            titleLabel.text = "Visual Ranking"
            dataArray = dbHelper.readData(section: "visual")
            mydataArray = dbHelper.readMyData(name: userName!, section: "visual")
            break
        case 4:
            titleLabel.text = "Number Ranking"
            dataArray = dbHelper.readData(section: "number")
            mydataArray = dbHelper.readMyData(name: userName!, section: "number")
            break
        case 5:
            titleLabel.text = "Aim Ranking"
            dataArray = dbHelper.readData(section: "aim")
            mydataArray = dbHelper.readMyData(name: userName!, section: "aim")
            break
        case 6:
            titleLabel.text = "Chimp Ranking"
            dataArray = dbHelper.readData(section: "chimp")
            mydataArray = dbHelper.readMyData(name: userName!, section: "chimp")
            break
        case 7:
            titleLabel.text = "Sequence Ranking"
            dataArray = dbHelper.readData(section: "sequence")
            mydataArray = dbHelper.readMyData(name: userName!, section: "sequence")
            break
        default:
            break
        }
        print(mydataArray)
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankTableViewCell

            if tableView == totalTableView {
                cell.nameLabel.text = String(dataArray[indexPath.row].myName)
                cell.recordLabel.text = String(dataArray[indexPath.row].myName)
                if let section = dataArray[indexPath.row].section {
                    cell.recordLabel.text = String(section)
                }
                return cell
            } else if tableView == myTableView {
                cell.mynameLabel.text = String(mydataArray[0].myName)
                cell.myrecordLabel.text = String(mydataArray[0].myName)
                if let section = mydataArray[0].section {
                    cell.myrecordLabel.text = String(section)
                }
                return cell
            }
            return cell
        }
        
        reload()
    }
    
}
