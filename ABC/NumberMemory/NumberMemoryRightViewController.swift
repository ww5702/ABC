//
//  NumberMemoryCheckViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/07.
//

import UIKit

protocol ContainerVCDelegatenumber3: AnyObject {
    func didReceivedValueFromContainerisOK(_ controller: NumberMemoryRightViewController, value: Bool)
}

class NumberMemoryRightViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var myAnswerLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    var answer: Int = 0
    var myAnswer: Int = 0
    var level: Int = 0
    var nextLevelOk = false

    weak var delegate: ContainerVCDelegatenumber3?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        nextLevelOk = true
        delegate?.didReceivedValueFromContainerisOK(self, value: nextLevelOk)
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
