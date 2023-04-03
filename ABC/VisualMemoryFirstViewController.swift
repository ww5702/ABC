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
    func didReceivedValueFromContainerLife(_ controller: VisualMemoryFirstViewController, value: Int)
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
    let RED = UIColor.systemRed
    let WRONG = UIColor.systemGray
    
    // 부모VC로부터 받은 값을 savescore에 전달(lblReceivedValueFromRoot)
    // 그리고 savescore를 다시 부모VC로 전달해줄것이다
    var savescore = 0
    
    // 게임이 시작되었는가?
    var isGameStart = false
    
    // 타일의 색 변경이 끝났는가?
    var isBtnColorChange = false
    
    // 한번의 시도당 목숨
    var gamelife = 3
    
    // 정답에 맞는지 체크
    var count = 0
    
    // 흰색으로 변하는 버튼의 개수 ( 맞출때마다 1씩 추가될 예정 )
    var value: Int = 3
    
    // 버튼에 bool값을 설정해주는 변수
    var btnbool : [Bool] = Array(repeating: false, count: 9)
    
    // 같은정답버튼을 여러번 누를 경우를 대비해서
    var btnbool2 : [Bool] = Array(repeating: false, count: 9)
    
    // 같은오답버튼을 여러번 누를 경우를 대비해서
    var btnbool3 : [Bool] = Array(repeating: false, count: 9)

    override func viewDidLoad() {
        
        // 실행될때마다 초기화되는 변수
        savescore = 0
        isGameStart = false
        
        setblue()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 게임시작
        gameStart()
    }
    
    // 눌렀을때 정답이면 하얀색으로 잠시 바꿔두었다가
    // 정답이 전부 눌려졌으면 다시 파란색으로

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
    
    func gameStart() {
        if isGameStart == true {
            // 이 밑으로는 계속해서 초기화 되야한다.
            if value < 5 {
                // 랜덤해서 1~9번중 색이 변할 버튼 결정
                // 레벨이 1이면 3개 2면 4개 3이면 5개를 뽑기
                var checkrandom = Set<Int>()
                while checkrandom.count < value {
                    let randomNum = Int.random(in: 1...9)
                    checkrandom.insert(randomNum)
                    print(checkrandom)
                }
                // 랜덤으로 뽑힌 버튼번호들 색변경
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
    
    func isGameGoodEnd() {
        count += 1
        if count == value {
            
            // 정답화면 0.5초 보여준 뒤 점수 전달 후 파란색으로 변경
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.setblue()
                self.savescore += 1
                self.delegate?.didReceivedValueFromContainer(self, value: self.savescore)
            })
            
            // set함수 초기화
            btnbool = Array(repeating: false, count: 9)
            btnbool2 = Array(repeating: false, count: 9)
            btnbool3 = Array(repeating: false, count: 9)
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
            btnbool = Array(repeating: false, count: 9)
            btnbool2 = Array(repeating: false, count: 9)
            btnbool3 = Array(repeating: false, count: 9)
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

}
