//
//  SequenceMemoryViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/24.
//

import UIKit
import Lottie

class SequenceMemoryViewController: UIViewController {
    
    
    @IBOutlet var touchView: UIView!
    @IBOutlet weak var explainLabel: UILabel!
    private var animationView: LottieAnimationView?
    
    @IBOutlet weak var levelStack: UIStackView!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    @IBOutlet weak var btn1Label: UIButton!
    @IBOutlet weak var btn2Label: UIButton!
    @IBOutlet weak var btn3Label: UIButton!
    @IBOutlet weak var btn4Label: UIButton!
    @IBOutlet weak var btn5Label: UIButton!
    @IBOutlet weak var btn6Label: UIButton!
    @IBOutlet weak var btn7Label: UIButton!
    @IBOutlet weak var btn8Label: UIButton!
    @IBOutlet weak var btn9Label: UIButton!
    
    let WHITE = UIColor(named: "buttonTouch")
    let BLUE = UIColor(named: "buttonReady")
    let WRONG = UIColor(named: "buttonWrong")
    
    var playOnce = false
    var isGameEnd = false
    var isBtnColorChangeCount = 0
    var isBtnColorChange = false    // 버튼 색 변경 끝났는가 (라운드 진행 끝?)
    var sequenceArr : [Int] = []
    var sequenceCount = 0   // 대조해보기 위한 변수
    var btnCount = -1.0
    var level = 1
    // 버튼에 bool값을 설정해주는 변수
    var btnbool : [Bool] = Array(repeating: false, count: 9)
    // 같은정답버튼을 여러번 누를 경우를 대비해서
    var btnbool2 : [Bool] = Array(repeating: false, count: 9)

    override func viewDidLoad() {
        super.viewDidLoad()
        levelStack.isHidden = true
        buttonStack.isHidden = true
        readyStartAnimation(x: "ready_start")
        explainLabel.text = "화면을 탭하여 시작하세요."
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showstart))
        touchView.isUserInteractionEnabled = true
        touchView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        if isBtnColorChange == true {
            if sequenceArr[sequenceCount] == 1 {
                btnColorChange2(x: btn1Label) // 잠시 표시 낸 다음 돌아가기
                goodEnd()
            } else {
                badEnd()
            }
        }
    }
    @IBAction func btn2(_ sender: UIButton) {
        if isBtnColorChange == true {
            if sequenceArr[sequenceCount] == 2 {
                btnColorChange2(x: btn2Label) // 잠시 표시 낸 다음 돌아가기
                goodEnd()
            } else {
                badEnd()
            }
        }

    }
    @IBAction func btn3(_ sender: UIButton) {
        if isBtnColorChange == true {
            if sequenceArr[sequenceCount] == 3 {
                btnColorChange2(x: btn3Label) // 잠시 표시 낸 다음 돌아가기
                goodEnd()
            } else {
                badEnd()
            }
        }

    }
    @IBAction func btn4(_ sender: UIButton) {
        if isBtnColorChange == true {
            if sequenceArr[sequenceCount] == 4 {
                btnColorChange2(x: btn4Label) // 잠시 표시 낸 다음 돌아가기
                goodEnd()
            } else {
                badEnd()
            }
        }

    }
    @IBAction func btn5(_ sender: UIButton) {
        if isBtnColorChange == true {
            if sequenceArr[sequenceCount] == 5 {
                btnColorChange2(x: btn5Label) // 잠시 표시 낸 다음 돌아가기
                goodEnd()
            } else {
                badEnd()
            }
        }

    }
    @IBAction func btn6(_ sender: UIButton) {
        if isBtnColorChange == true {
            if sequenceArr[sequenceCount] == 6 {
                btnColorChange2(x: btn6Label) // 잠시 표시 낸 다음 돌아가기
                goodEnd()
            } else {
                badEnd()
            }
        }

    }
    @IBAction func btn7(_ sender: UIButton) {
        if isBtnColorChange == true {
            if sequenceArr[sequenceCount] == 7 {
                btnColorChange2(x: btn7Label) // 잠시 표시 낸 다음 돌아가기
                goodEnd()
            } else {
                badEnd()
            }
        }

    }
    @IBAction func btn8(_ sender: UIButton) {
        if isBtnColorChange == true {
            if sequenceArr[sequenceCount] == 8 {
                btnColorChange2(x: btn8Label) // 잠시 표시 낸 다음 돌아가기
                goodEnd()
            } else {
                badEnd()
            }
        }

    }
    @IBAction func btn9(_ sender: UIButton) {
        if isBtnColorChange == true {
            if sequenceArr[sequenceCount] == 9 {
                btnColorChange2(x: btn9Label) // 잠시 표시 낸 다음 돌아가기
                goodEnd()
            } else {
                badEnd()
            }
        }

    }

    
    func gameStart() {
        
        let randomNum = Int.random(in: 1...9)
        sequenceArr.append(randomNum)
        print("현재 저장되어있는 랜덤수 : \(sequenceArr)")
        // 라운드 진행마다 1초 후에 버튼들 표시
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
            for i in self.sequenceArr {
                switch i {
                case 1:
                    self.btnCount += 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.0 + 0.6*self.btnCount, execute: {
                        self.btnColorChange(x: self.btn1Label)
                        print("1 실행")
                    })
                    break
                case 2:
                    self.btnCount += 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6*self.btnCount, execute: {
                        self.btnColorChange(x: self.btn2Label)
                        print("2 실행")
                        if i == self.sequenceArr.last {
                            print("마지막 버튼 색 변경")
                            self.isBtnColorChange = true
                        }
                    })
                    break
                case 3:
                    self.btnCount += 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6*self.btnCount, execute: {
                        self.btnColorChange(x: self.btn3Label)
                        print("3 실행")
                        if i == self.sequenceArr.last {
                            print("마지막 버튼 색 변경")
                            self.isBtnColorChange = true
                        }
                    })
                    break
                case 4:
                    self.btnCount += 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6*self.btnCount, execute: {
                        self.btnColorChange(x: self.btn4Label)
                        print("4 실행")
                        if i == self.sequenceArr.last {
                            print("마지막 버튼 색 변경")
                            self.isBtnColorChange = true
                        }
                    })
                    break
                case 5:
                    self.btnCount += 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6*self.btnCount, execute: {
                        self.btnColorChange(x: self.btn5Label)
                        print("5 실행")
                        if i == self.sequenceArr.last {
                            print("마지막 버튼 색 변경")
                            self.isBtnColorChange = true
                        }
                    })
                    break
                case 6:
                    self.btnCount += 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6*self.btnCount, execute: {
                        self.btnColorChange(x: self.btn6Label)
                        print("6 실행")
                        if i == self.sequenceArr.last {
                            print("마지막 버튼 색 변경")
                            self.isBtnColorChange = true
                        }
                    })
                    break
                case 7:
                    self.btnCount += 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6*self.btnCount, execute: {
                        self.btnColorChange(x: self.btn7Label)
                        print("7 실행")
                        if i == self.sequenceArr.last {
                            print("마지막 버튼 색 변경")
                            self.isBtnColorChange = true
                        }
                    })
                    break
                case 8:
                    self.btnCount += 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6*self.btnCount, execute: {
                        self.btnColorChange(x: self.btn8Label)
                        print("8 실행")
                        if i == self.sequenceArr.last {
                            print("마지막 버튼 색 변경")
                            self.isBtnColorChange = true
                        }
                    })
                    break
                case 9:
                    self.btnCount += 1.0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6*self.btnCount, execute: {
                        self.btnColorChange(x: self.btn9Label)
                        print("9 실행")
                        if i == self.sequenceArr.last {
                            print("마지막 버튼 색 변경")
                            self.isBtnColorChange = true
                        }
                    })
                    break
                default:
                    break
                }
            }
        })
        
    }
    
    func btnColorChange(x: UIButton) {
        isBtnColorChangeCount += 1
        x.backgroundColor = self.WHITE
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            x.backgroundColor = self.BLUE
        })
        if isBtnColorChangeCount == level {
            isBtnColorChange = true
        }
        
    }
    
    func btnColorChange2(x: UIButton) {
        x.backgroundColor = self.WHITE
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
            x.backgroundColor = self.BLUE
        })
    }
    
    // 순서가 맞았다면
    func goodEnd() {
        // 레벨이 끝났을 경우
        if sequenceArr.count-1 == sequenceCount {
            // count 초기화 & 게임 시작
            sequenceCount = 0
            isBtnColorChange = false
            btnCount = -1.0
            level += 1
            
            gameStart()
        } else {
            // 계속해서 게임 진행
            sequenceCount += 1
        }
        
    }
    func badEnd() {
        
    }
    
    
    @objc func showstart() {
        setblue()
        setradius()
        levelStack.isHidden = false
        buttonStack.isHidden = false
        explainLabel.isHidden = true
        animationView!.stop()
        animationView!.isHidden = true
        
        // 처음 게임 시작
        if playOnce == false {
            // playOnce가 false일때만 게임 시작
            playOnce = true
            sequenceArr = []
            gameStart()
        }
    }
    func readyStartAnimation(x : String) {
        animationView = .init(name: x)
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 350)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 2.0
        view.addSubview(animationView!)
        animationView!.play(fromFrame: 0, toFrame: 190)
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
    
    func setradius() {
        btn1Label.layer.cornerRadius = 10
        btn2Label.layer.cornerRadius = 10
        btn3Label.layer.cornerRadius = 10
        btn4Label.layer.cornerRadius = 10
        btn5Label.layer.cornerRadius = 10
        btn6Label.layer.cornerRadius = 10
        btn7Label.layer.cornerRadius = 10
        btn8Label.layer.cornerRadius = 10
        btn9Label.layer.cornerRadius = 10
    }
}
