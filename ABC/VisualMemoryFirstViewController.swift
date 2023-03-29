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
    let WRONG = UIColor.systemGray
    // 부모VC로부터 받은 값을 savescore에 전달(lblReceivedValueFromRoot)
    // 그리고 savescore를 다시 부모VC로 전달해줄것이다
    var savescore = 0
    
    // 게임이 시작되었는가?
    var isGameStart = false
    
    // 정답에 맞는지 체크
    var count = 0
    
    // 흰색으로 변하는 버튼의 개수 ( 맞출때마다 1씩 추가될 예정 )
    var value: Int = 3
    
    // 버튼에 bool값을 설정해주는 변수
    var btnbool : [Bool] = Array(repeating: false, count: 9)

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
        
        print("1번 눌림")
        if btnbool[0] == true {
            print("정답")
            btn1Label.backgroundColor = WHITE
            isGameGoodEnd()
            
        } else {
            print("틀림")
            btn1Label.backgroundColor = WRONG
        }
        
        
    }
    @IBAction func btn2(_ sender: UIButton) {
        if btnbool[1] == true {
            print("정답")
            btn2Label.backgroundColor = WHITE
            isGameGoodEnd()
            
        } else {
            print("틀림")
            btn2Label.backgroundColor = WRONG
        }
    }
    @IBAction func btn3(_ sender: UIButton) {
        if btnbool[2] == true {
            print("정답")
            btn3Label.backgroundColor = WHITE
            isGameGoodEnd()
        } else {
            print("틀림")
            btn3Label.backgroundColor = WRONG
        }
    }
    @IBAction func btn4(_ sender: UIButton) {
        if btnbool[3] == true {
            print("정답")
            btn4Label.backgroundColor = WHITE
            isGameGoodEnd()
        } else {
            print("틀림")
            btn4Label.backgroundColor = WRONG
        }
    }
    @IBAction func btn5(_ sender: UIButton) {
        if btnbool[4] == true {
            print("정답")
            btn5Label.backgroundColor = WHITE
            isGameGoodEnd()
        } else {
            print("틀림")
            btn5Label.backgroundColor = WRONG
        }
    }
    @IBAction func btn6(_ sender: UIButton) {
        if btnbool[5] == true {
            print("정답")
            btn6Label.backgroundColor = WHITE
            isGameGoodEnd()
        } else {
            print("틀림")
            btn6Label.backgroundColor = WRONG
        }
    }
    @IBAction func btn7(_ sender: UIButton) {
        if btnbool[6] == true {
            print("정답")
            btn7Label.backgroundColor = WHITE
            isGameGoodEnd()
        } else {
            print("틀림")
            btn7Label.backgroundColor = WRONG
        }
    }
    @IBAction func btn8(_ sender: UIButton) {
        if btnbool[7] == true {
            print("정답")
            btn8Label.backgroundColor = WHITE
            isGameGoodEnd()
        } else {
            print("틀림")
            btn8Label.backgroundColor = WRONG
        }
    }
    @IBAction func btn9(_ sender: UIButton) {
        if btnbool[8] == true {
            print("정답")
            btn9Label.backgroundColor = WHITE
            isGameGoodEnd()
        } else {
            print("틀림")
            btn9Label.backgroundColor = WRONG
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
                        break
                    case 2:
                        btn2Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        break
                    case 3:
                        btn3Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        break
                    case 4:
                        btn4Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        break
                    case 5:
                        btn5Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        break
                    case 6:
                        btn6Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        break
                    case 7:
                        btn7Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        break
                    case 8:
                        btn8Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        break
                    case 9:
                        btn9Label.backgroundColor = WHITE
                        btnbool[i-1] = true
                        break
                    default:
                        break
                    }
                }
                
                print(btnbool)

                // 몇초뒤에 다시 색을 변경해주어야한다.
                // 1초 뒤에 파란색으로 다시 돌아가기
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self.setblue()
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
    
    func setScore(_ value: Int) {
        savescore = value
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
            // 점수를 1점 늘린다음 스코어를 전달
            savescore += 1
            delegate?.didReceivedValueFromContainer(self, value: savescore)
            
            // 점수 전달 후 0.3초 후 파란색으로 변경
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.setblue()
            })
            
            // set함수 초기화
            btnbool = Array(repeating: false, count: 9)
            // 이제 +1 해준다음 게임 다시 시작
            value += 1
            // count또한 초기화
            count = 0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                self.gameStart()
            })
        }
    }

}
