//
//  NumberMemorySecondViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/05.
//

import UIKit

protocol ContainerVCDelegatenumber2: AnyObject {
    func didReceivedValueFromContainerNum(_ controller: NumberMemorySecondViewController, value: Int)
}

class NumberMemorySecondViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var myAnswerLabel: UILabel!
    
    var answer : Int = 0
    var submitAnswer: Int = 100
    var iscorrectTime = false
    
    weak var delegate: ContainerVCDelegatenumber2?

    override func viewDidLoad() {
        super.viewDidLoad()

        answerLabel.text = String(answer)
        play()
    }
    

    @IBAction func zerobtn(_ sender: UIButton) {
    }
    @IBAction func btn1(_ sender: UIButton) {
    }
    @IBAction func btn2(_ sender: UIButton) {
    }
    @IBAction func btn3(_ sender: UIButton) {
    }
    @IBAction func btn4(_ sender: UIButton) {
    }
    @IBAction func btn5(_ sender: UIButton) {
    }
    @IBAction func btn6(_ sender: UIButton) {
    }
    @IBAction func btn7(_ sender: UIButton) {
    }
    @IBAction func btn8(_ sender: UIButton) {
    }
    @IBAction func btn9(_ sender: UIButton) {
    }
    @IBAction func btnErase(_ sender: UIButton) {
    }
    
    
    
    
    
    func play() {
        if iscorrectTime == true {
            print("answer = \(answer)")
            answerLabel.text = String(answer)
        }
    }

    @IBAction func sendAnswer(_ sender: UIButton) {
        delegate?.didReceivedValueFromContainerNum(self, value: submitAnswer)
    }
    
    func setAnswer(_ value: Int){
        answer = value
    }
    func iscorrectTime(_ value: Bool) {
        iscorrectTime = value
    }
    func setgamego() {
        play()
    }
}
