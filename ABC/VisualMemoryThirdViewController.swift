//
//  VisualMemoryThirdViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/03.
//

import UIKit

protocol ContainerVCDelegate3: AnyObject {
    // 자식 VC로부터 값을 전달받은뒤 부모 컨테이너에서 그 값을 다루는 내용을 구현
    func didReceivedValueFromContainer(_ controller: VisualMemoryThirdViewController, value: Int)
    func didReceivedValueFromContainerLife(_ controller: VisualMemoryThirdViewController, value: Int)
}

class VisualMemoryThirdViewController: UIViewController {
    weak var delegate: ContainerVCDelegate3?
    
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
    @IBOutlet weak var btn17Label: UIButton!
    @IBOutlet weak var btn18Label: UIButton!
    @IBOutlet weak var btn19Label: UIButton!
    @IBOutlet weak var btn20Label: UIButton!
    @IBOutlet weak var btn21Label: UIButton!
    @IBOutlet weak var btn22Label: UIButton!
    @IBOutlet weak var btn23Label: UIButton!
    @IBOutlet weak var btn24Label: UIButton!
    @IBOutlet weak var btn25Label: UIButton!
    
    // 함수들
    let WHITE = UIColor.white
    let BLUE = UIColor.systemBlue
    let RED = UIColor.systemRed
    let WRONG = UIColor.systemGray
    
    var savescore : Int = 0
    var isGameStart = false
    
    var isBtnColorChange = false
    var gamelife = 3
    var count = 0
    var value: Int = 8
    
    var btnbool : [Bool] = Array(repeating: false, count: 25)
    var btnbool2 : [Bool] = Array(repeating: false, count: 25)
    var btnbool3 : [Bool] = Array(repeating: false, count: 25)

    override func viewDidLoad() {
        super.viewDidLoad()

        setblue()
    }
    
    func gameStart() {
        if isGameStart == true {
            if value < 12 {
                var checkrandom = Set<Int>()
                while checkrandom.count < value {
                    let randomNum = Int.random(in: 1...9)
                    checkrandom.insert(randomNum)
                    print(checkrandom)
                }
                for i in checkrandom {
                    switch i {
                        // 색깔을 하얀색으로 바꾸고 bool을 true로 변경
                    case 1:
                        btn1Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 2:
                        btn2Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 3:
                        btn3Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 4:
                        btn4Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 5:
                        btn5Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 6:
                        btn6Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 7:
                        btn7Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 8:
                        btn8Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 9:
                        btn9Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 10:
                        btn10Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 11:
                        btn11Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 12:
                        btn12Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 13:
                        btn13Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 14:
                        btn14Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 15:
                        btn15Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                    case 16:
                        btn16Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        btnbool2[i-1] = true
                        btnbool3[i-1] = true
                        break
                        
                    default:
                        break
                    }
                }
                print(btnbool)
                
                // 몇초뒤에 다시 색을 변경해주어야한다.
                // 1초 뒤에 파란색으로 다시 돌아가기
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    self.setblue()
                    self.isBtnColorChange = true
                })
                
            }
        }
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
        btn17Label.backgroundColor = BLUE
        btn18Label.backgroundColor = BLUE
        btn19Label.backgroundColor = BLUE
        btn20Label.backgroundColor = BLUE
        btn21Label.backgroundColor = BLUE
        btn22Label.backgroundColor = BLUE
        btn23Label.backgroundColor = BLUE
        btn24Label.backgroundColor = BLUE
        btn25Label.backgroundColor = BLUE
    }
    
    // 부모VC로 보내는 함수
    func setScore(_ value: Int) {
        savescore = value
    }
    func setLife(_ value: Int) {
    }
    func setisGameStart(_ boolvalue : Bool) {
        isGameStart = boolvalue
    }
    func setgamego() {
        gameStart()
    }

}
