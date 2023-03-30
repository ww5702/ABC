//
//  VisualMemorySecondViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/30.
//

import UIKit

protocol ContainerVCDelegate2: AnyObject {
    // 자식 VC로부터 값을 전달받은뒤 부모 컨테이너에서 그 값을 다루는 내용을 구현
    func didReceivedValueFromContainer(_ controller: VisualMemorySecondViewController, value: Int)
    func didReceivedValueFromContainerLife(_ controller: VisualMemorySecondViewController, value: Int)
}

class VisualMemorySecondViewController: UIViewController {
    
    @IBOutlet weak var btn1Label: UIButton!
    @IBOutlet weak var btn2Label: UIButton!
    @IBOutlet weak var btn3Label: UIButton!
    @IBOutlet weak var btn4Label: UIButton!
    @IBOutlet weak var btn5Label: UIButton!
    @IBOutlet weak var btn6Label: UIButton!
    @IBOutlet weak var btn7Label: UIButton!
    @IBOutlet weak var btn8Label: UIButton!
    @IBOutlet weak var btn9Label: UIButton!
    @IBOutlet weak var btn10Label: UIButton!
    @IBOutlet weak var btn11Label: UIButton!
    @IBOutlet weak var btn12Label: UIButton!
    @IBOutlet weak var btn13Label: UIButton!
    @IBOutlet weak var btn14Label: UIButton!
    @IBOutlet weak var btn15Label: UIButton!
    @IBOutlet weak var btn16Label: UIButton!
    
    weak var delegate: ContainerVCDelegate2?
    
    let WHITE = UIColor.white
    let BLUE = UIColor.systemBlue
    let RED = UIColor.systemRed
    let WRONG = UIColor.systemGray
    
    // 2단계로 넘어온순간은 무조건 점수가 3점부터 시작이기 떄문에
    var savescore = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setblue()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btn1(_ sender: UIButton) {
        // 전송되는지 테스트
        savescore += 1
        delegate?.didReceivedValueFromContainer(self, value: savescore)
        delegate?.didReceivedValueFromContainerLife(self, value: 1)
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
        btn10Label.backgroundColor = BLUE
        btn11Label.backgroundColor = BLUE
        btn12Label.backgroundColor = BLUE
        btn13Label.backgroundColor = BLUE
        btn14Label.backgroundColor = BLUE
        btn15Label.backgroundColor = BLUE
        btn16Label.backgroundColor = BLUE
    }

    
    
    
    // 부모VC로 보내는 함수
    func setScore(_ value: Int) {
        savescore = value
    }
    func setLife(_ value: Int) {
    }
}
