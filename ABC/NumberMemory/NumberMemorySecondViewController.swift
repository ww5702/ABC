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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var myAnswerLabel: UILabel!
    
    var answer : Int = 0
    var submitAnswer: Int = 0
    var iscorrectTime = false
    var recordanswer: [String] = []
    var recordanswerstring = ""
    
    weak var delegate: ContainerVCDelegatenumber2?

    override func viewDidLoad() {
        print("재시작")
        super.viewDidLoad()
        titleLabel.text = "숫자는 무엇이었을까요?"
        explainLabel.text = "정답 입력 후 Submit버튼을 눌러주세요"

    }
    

    @IBAction func zerobtn(_ sender: UIButton) {
        recordanswer.append("0")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btn1(_ sender: UIButton) {
        recordanswer.append("1")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btn2(_ sender: UIButton) {
        recordanswer.append("2")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btn3(_ sender: UIButton) {
        recordanswer.append("3")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btn4(_ sender: UIButton) {
        recordanswer.append("4")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btn5(_ sender: UIButton) {
        recordanswer.append("5")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btn6(_ sender: UIButton) {
        recordanswer.append("6")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btn7(_ sender: UIButton) {
        recordanswer.append("7")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btn8(_ sender: UIButton) {
        recordanswer.append("8")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btn9(_ sender: UIButton) {
        recordanswer.append("9")
        recordanswerstring = recordanswer.joined(separator:"")
        myAnswerLabel.text = recordanswerstring
        print(Int(recordanswerstring)!)
    }
    @IBAction func btnErase(_ sender: UIButton) {
        if recordanswer.isEmpty == true {
            let tooEarly = UIAlertController(title: "정보", message: "아무 정답도 적지 않았습니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            tooEarly.addAction(okAction)
            present(tooEarly,animated: true)
        } else {
            recordanswer.removeLast()
            recordanswerstring = recordanswer.joined(separator:"")
            myAnswerLabel.text = recordanswerstring
        }
    }
    
    
    
    func play() {
        if iscorrectTime == true {
            print("game start")
        }
    }

    @IBAction func submit(_ sender: UIButton) {
        submitAnswer = Int(recordanswerstring)!
        delegate?.didReceivedValueFromContainerNum(self, value: submitAnswer)
    }
    
    func setAnswer(_ value: Int){
        answer = value
    }
    func iscorrectTime(_ value: Bool) {
        iscorrectTime = value
    }
    func setgamego() {
        recordanswer = []
        recordanswerstring = ""
        myAnswerLabel.text = ""
    }
}
