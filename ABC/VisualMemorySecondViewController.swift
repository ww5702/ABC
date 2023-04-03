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
    
    var savescore : Int = 0
    var isGameStart = false
    
    var isBtnColorChange = false
    var gamelife = 3
    var count = 0
    var value: Int = 5
    
    var btnbool : [Bool] = Array(repeating: false, count: 16)
    var btnbool2 : [Bool] = Array(repeating: false, count: 16)
    var btnbool3 : [Bool] = Array(repeating: false, count: 16)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setblue()
    }
    
    
    @IBAction func btn1(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[0] == true {
                if btnbool2[0] == true {
                    btn1Label.backgroundColor = WHITE
                    btnbool2[0] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[0] == false {
                    btn1Label.backgroundColor = WRONG
                    btnbool3[0] = true
                    isGameBadEnd()
                }
                
            }
        }
    }
    @IBAction func btn2(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[1] == true {
                if btnbool2[1] == true {
                    btn2Label.backgroundColor = WHITE
                    btnbool2[1] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[1] == false {
                    btn2Label.backgroundColor = WRONG
                    btnbool3[1] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn3(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[2] == true {
                if btnbool2[2] == true {
                    btn3Label.backgroundColor = WHITE
                    btnbool2[2] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[2] == false {
                    btn3Label.backgroundColor = WRONG
                    btnbool3[2] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn4(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[3] == true {
                if btnbool2[3] == true {
                    btn4Label.backgroundColor = WHITE
                    btnbool2[3] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[3] == false {
                    btn4Label.backgroundColor = WRONG
                    btnbool3[3] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn5(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[4] == true {
                if btnbool2[4] == true {
                    btn5Label.backgroundColor = WHITE
                    btnbool2[4] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[4] == false {
                    btn5Label.backgroundColor = WRONG
                    btnbool3[4] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn6(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[5] == true {
                if btnbool2[5] == true {
                    btn6Label.backgroundColor = WHITE
                    btnbool2[5] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[5] == false {
                    btn6Label.backgroundColor = WRONG
                    btnbool3[5] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn7(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[6] == true {
                if btnbool2[6] == true {
                    btn7Label.backgroundColor = WHITE
                    btnbool2[6] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[6] == false {
                    btn7Label.backgroundColor = WRONG
                    btnbool3[6] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn8(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[7] == true {
                if btnbool2[7] == true {
                    btn8Label.backgroundColor = WHITE
                    btnbool2[7] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[7] == false {
                    btn8Label.backgroundColor = WRONG
                    btnbool3[7] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn9(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[8] == true {
                if btnbool2[8] == true {
                    btn9Label.backgroundColor = WHITE
                    btnbool2[8] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[8] == false {
                    btn9Label.backgroundColor = WRONG
                    btnbool3[8] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn10(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[9] == true {
                if btnbool2[9] == true {
                    btn10Label.backgroundColor = WHITE
                    btnbool2[9] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[9] == false {
                    btn10Label.backgroundColor = WRONG
                    btnbool3[9] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn11(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[10] == true {
                if btnbool2[10] == true {
                    btn11Label.backgroundColor = WHITE
                    btnbool2[10] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[10] == false {
                    btn11Label.backgroundColor = WRONG
                    btnbool3[10] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn12(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[11] == true {
                if btnbool2[11] == true {
                    btn12Label.backgroundColor = WHITE
                    btnbool2[11] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[11] == false {
                    btn12Label.backgroundColor = WRONG
                    btnbool3[11] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn13(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[12] == true {
                if btnbool2[12] == true {
                    btn13Label.backgroundColor = WHITE
                    btnbool2[12] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[12] == false {
                    btn13Label.backgroundColor = WRONG
                    btnbool3[12] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn14(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[13] == true {
                if btnbool2[13] == true {
                    btn14Label.backgroundColor = WHITE
                    btnbool2[13] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[13] == false {
                    btn14Label.backgroundColor = WRONG
                    btnbool3[13] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn15(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[14] == true {
                if btnbool2[14] == true {
                    btn15Label.backgroundColor = WHITE
                    btnbool2[14] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[14] == false {
                    btn15Label.backgroundColor = WRONG
                    btnbool3[14] = true
                    isGameBadEnd()
                }
            }
        }
    }
    @IBAction func btn16(_ sender: UIButton) {
        if isBtnColorChange == true {
            if btnbool[15] == true {
                if btnbool2[15] == true {
                    btn16Label.backgroundColor = WHITE
                    btnbool2[15] = false
                    isGameGoodEnd()
                }
            } else {
                if btnbool3[15] == false {
                    btn16Label.backgroundColor = WRONG
                    btnbool3[15] = true
                    isGameBadEnd()
                }
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
    }
    
    func gameStart() {
        if isGameStart == true {
            if value < 8 {
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
    
    func isGameGoodEnd() {
        count += 1
        if count == value {

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.setblue()
                self.savescore += 1
                self.delegate?.didReceivedValueFromContainer(self, value: self.savescore)
            })
            
            // set함수 초기화
            btnbool = Array(repeating: false, count: 16)
            btnbool2 = Array(repeating: false, count: 16)
            btnbool3 = Array(repeating: false, count: 16)
            // 이제 +1 해준다음 게임 다시 시작
            value += 1
            // count또한 초기화
            count = 0
            // 타일의 색 변경되었는지도 초기화
            isBtnColorChange = false
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                self.gameStart()
            })
        }
    }
    func isGameBadEnd() {
        gamelife -= 1
        // 게임당의 목숨 3개 다 쓸시
        if gamelife <= 0 {
            // 변수들 다시 초기화
            // set함수 초기화
            btnbool = Array(repeating: false, count: 16)
            btnbool2 = Array(repeating: false, count: 16)
            btnbool3 = Array(repeating: false, count: 16)
            // count또한 초기화
            count = 0
            // gamelife 초기화
            gamelife = 3
            
            // 타일의 색 변경되었는지도 초기화
            isBtnColorChange = false
            
            // 전체 목숨에서 하나 깎고
            delegate?.didReceivedValueFromContainerLife(self, value: 1)
            
            // 화면 잠시 빨간색으로 변경 후 다시 파란색으로
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.setblue()
            })
            
            // 게임 다시 시작
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                self.gameStart()
            })
            
        }
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
