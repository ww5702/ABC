//
//  VisualMemoryFirstViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/28.
//

import UIKit

// 대리자 프로토콜 작성

protocol ContainerVCDelegate: AnyObject {
    // 자식 VC로부터 값을 전달받은뒤 부모 컨테이너에서 그 값을 다루는 내용을 구현
    func didReceivedValueFromContainer(_ controller: VisualMemoryFirstViewController, value: Int)
}

class VisualMemoryFirstViewController: UIViewController {
    
    @IBOutlet weak var btn1Label: UIButton!
    @IBOutlet weak var btn2Label: UIButton!
    @IBOutlet weak var btn3Label: UIButton!
    @IBOutlet weak var btn4Label: UIButton!
    @IBOutlet weak var btn5Label: UIButton!
    @IBOutlet weak var btn6Label: UIButton!
    @IBOutlet weak var btn7Label: UIButton!
    @IBOutlet weak var btn8Label: UIButton!
    @IBOutlet weak var btn9Label: UIButton!
    
    // delegate변수 설정, ContainerVCDelegate를 준수한다면 어느 클래스나 구조체도 여기에 할당가능
    weak var delegate: ContainerVCDelegate?
    
    let WHITE = UIColor.white
    let BLUE = UIColor.systemBlue
    // 부모VC로부터 받은 값을 savescore에 전달(lblReceivedValueFromRoot)
    // 그리고 savescore를 다시 부모VC로 전달해줄것이다
    var savescore = 0

    override func viewDidLoad() {
        setblue()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 게임시작
    }
    

    @IBAction func btn1(_ sender: UIButton) {
        btn1Label.backgroundColor = WHITE
        print("1번 눌림")
        // 일단 점수를 1점 늘린다음 스코어를 전달
        savescore += 1
        delegate?.didReceivedValueFromContainer(self, value: savescore)
        
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
        self.view.backgroundColor = WHITE
        print("9번 눌림")
    }
    
    func gameStart() {
    }
    
    func setblue() {
        btn1Label.backgroundColor = BLUE
        btn2Label.backgroundColor = BLUE
        btn3Label.backgroundColor = BLUE
        btn4Label.backgroundColor = BLUE
        btn5Label.backgroundColor = BLUE
        btn6Label.backgroundColor = BLUE
        btn7Label.backgroundColor = BLUE
        btn8Label.backgroundColor = BLUE
        btn9Label.backgroundColor = BLUE
    }
    
    func setScore(_ value: Int) {
        savescore = value
    }

}
