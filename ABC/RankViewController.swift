//
//  RankViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/05/02.
//

import UIKit

var name = ["1","2"]

class RankViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = name[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
