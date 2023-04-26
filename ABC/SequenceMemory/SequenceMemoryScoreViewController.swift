//
//  SequenceMemoryScoreViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/26.
//

import UIKit

class SequenceMemoryScoreViewController: UIViewController {
    
    var data = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data -= 1
        scoreLabel.text = "Level \(data)"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func retryBtn(_ sender: UIButton) {
    }
    @IBAction func gotoHome(_ sender: UIButton) {
    }
}
