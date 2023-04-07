//
//  NumberMemoryCheckViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/07.
//

import UIKit

class NumberMemoryRightViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var myAnswerLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    var answer: Int = 0
    var myAnswer: Int = 0
    var level: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        
    }
    
    func setAnswer(_ value: Int) {
        answer = value
    }
    func setMyAnswer(_ value: Int) {
        myAnswer = value
    }
    func setLevel(_ value: Int) {
        level = value
    }
    func play() {
        answerLabel.text = String(answer)
        myAnswerLabel.text = String(myAnswer)
        levelLabel.text = "\(level) LEVEL COMPLETE"
    }
    
}
