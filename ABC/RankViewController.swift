//
//  RankViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/05/02.
//

import UIKit



class RankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var name = ["1","2"]
    var record = ["123","456"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankTableViewCell
        
        cell.nameLabel.text = name[indexPath.row]
        cell.recordLabel.text = record[indexPath.row]
        
        
        return cell
    }

}
