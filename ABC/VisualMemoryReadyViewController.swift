//
//  VisualMemoryReadyViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/29.
//

import UIKit

class VisualMemoryReadyViewController: UIViewController {

    @IBOutlet weak var readyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readyLabel.text = "Are you ready?\nPress 'Game Start' Button"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
