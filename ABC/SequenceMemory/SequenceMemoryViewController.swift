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
    var sequenceArr : [Int] = []

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

    
    func gameStart() {
        let randomNum = Int.random(in: 1...9)
        sequenceArr.append(randomNum)
        // 라운드 진행마다 1초 후에 버튼들 표시
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
            for i in self.sequenceArr {
                switch i {
                case 1:
                    self.btnColorChange(x: self.btn1Label)
                    break
                case 2:
                    self.btnColorChange(x: self.btn2Label)
                    break
                case 3:
                    self.btnColorChange(x: self.btn3Label)
                    break
                case 4:
                    self.btnColorChange(x: self.btn4Label)
                    break
                case 5:
                    self.btnColorChange(x: self.btn5Label)
                    break
                case 6:
                    self.btnColorChange(x: self.btn6Label)
                    break
                case 7:
                    self.btnColorChange(x: self.btn7Label)
                    break
                case 8:
                    self.btnColorChange(x: self.btn8Label)
                    break
                case 9:
                    self.btnColorChange(x: self.btn9Label)
                    break
                default:
                    break
                }
            }
        })
    }
    
    func btnColorChange(x: UIButton) {
        x.backgroundColor = self.WHITE
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            x.backgroundColor = self.BLUE
        })
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
