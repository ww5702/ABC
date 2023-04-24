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
        print("asdfasdf")
    }
    
    
    @objc func showstart() {
        levelStack.isHidden = false
        buttonStack.isHidden = false
        explainLabel.isHidden = true
        animationView!.stop()
        animationView!.isHidden = true
        gameStart()
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
}
