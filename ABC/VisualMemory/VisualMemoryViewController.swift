//
//  VisualMemoryViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/24.
//

import UIKit

class VisualMemoryViewController: UIViewController {
    
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var readyView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    // 컨테이너 뷰 컨트롤러를 참조하는 변수 생성
    // 해당 변수가 있어야 VisualMemoryViewController의 아무곳에서 나중에 보낼 타깃을 가리킬수있다.
    private var containerVC: VisualMemoryFirstViewController?
    private var containerVC2: VisualMemorySecondViewController?
    private var containerVC3: VisualMemoryThirdViewController?
    private var containerVC4: VisualMemoryFourthViewController?
    
    @IBOutlet weak var lifeLabel: UILabel!
    // 자식VC로 부터 받은 값을 표시할 레이블
    @IBOutlet weak var scoreLabel: UILabel!
    
    let WHITE = UIColor.white
    let BLUE = UIColor.blue
    
    var score = 0
    var life = 3
    
    var isGameStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startBtn.isHidden = false
        
        lifeLabel.text = "Life | \(life)"
        scoreLabel.text = "Score | \(score)"
        
        readyView.alpha = 1
        firstView.alpha = 0
        secondView.alpha = 0
        thirdView.alpha = 0
        fourthView.alpha = 0

    }

    @IBAction func gameStart(_ sender: Any) {
        if isGameStart == true {
            let tooEarly = UIAlertController(title: "정보", message: "이미 게임이 실행중입니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            tooEarly.addAction(okAction)
            present(tooEarly,animated: true)
        } else {
            readyView.alpha = 0
            firstView.alpha = 1
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 0
            
            startBtn.isHidden = true
            // 스코어를 전송
            containerVC?.setScore(score)
            // isGamestart를 true로 전송
            isGameStart = true
            containerVC?.setisGameStart(isGameStart)
            
            containerVC?.setgamego()
        }
    }
    
    // segue.identifer별 분기 설정
    // 해당 함수는 뷰 컨트롤러의 라이프 사이클의 초기에 실행된다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "firstContainer":
            // 컨테이너 뷰 컨트롤러를 containerVC에 지정
            containerVC = segue.destination as? VisualMemoryFirstViewController
            // containerVC의 delegate변수를 RootVC 자신(self)로 지정
            containerVC?.delegate = self
            
        case "secondContainer":
            containerVC2 = segue.destination as? VisualMemorySecondViewController
            containerVC2?.delegate = self
            
        case "thirdContainer":
            containerVC3 = segue.destination as? VisualMemoryThirdViewController
            containerVC3?.delegate = self
            
        case "fourthContainer":
            containerVC4 = segue.destination as? VisualMemoryFourthViewController
            containerVC4?.delegate = self
            
        default:
            break
        }
    }
    
    func gotoResult() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "VisualMemoryScoreViewController") as? VisualMemoryScoreViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.data = score
            self.present(vc, animated: true)
        }
    }
    

}

// ContainerVCDelegate를 준수하는 확장 구현
extension VisualMemoryViewController: ContainerVCDelegate {
    func didReceivedValueFromContainer(_ controller: VisualMemoryFirstViewController, value: Int) {
        score = value
        scoreLabel.text = "Score | \(score)"
        if value >= 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.readyView.alpha = 0
                self.firstView.alpha = 0
                self.secondView.alpha = 1
                self.thirdView.alpha = 0
                self.fourthView.alpha = 0
                self.containerVC2?.setisGameStart(self.isGameStart)
                self.containerVC2?.setScore(self.score)
                self.containerVC2?.setgamego()
            })
        } else if value >= 3 {
            readyView.alpha = 0
            firstView.alpha = 0
            secondView.alpha = 1
            thirdView.alpha = 0
            fourthView.alpha = 0
            containerVC2?.setisGameStart(isGameStart)
            containerVC2?.setScore(score)
            containerVC2?.setgamego()
        }
    }
    func didReceivedValueFromContainerLife(_ controller: VisualMemoryFirstViewController, value: Int) {
        // 잠시 빨간색 후 다시 파란색
        self.view.backgroundColor = UIColor.systemRed
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.view.backgroundColor = UIColor(named: "background")
        })
        
        life -= value
        if life > 0 {
            lifeLabel.text = "Life | \(life)"
        } else {
            gotoResult()
        }
        
    }
}

extension VisualMemoryViewController: ContainerVCDelegate2 {
    func didReceivedValueFromContainer(_ controller: VisualMemorySecondViewController, value: Int) {
        score = value
        scoreLabel.text = "Score | \(score)"
        if value >= 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.readyView.alpha = 0
                self.firstView.alpha = 0
                self.secondView.alpha = 0
                self.thirdView.alpha = 1
                self.fourthView.alpha = 0
                self.containerVC3?.setisGameStart(self.isGameStart)
                self.containerVC3?.setScore(self.score)
                self.containerVC3?.setgamego()
            })
        } else if value >= 6 {
            readyView.alpha = 0
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 1
            fourthView.alpha = 0
            containerVC3?.setisGameStart(isGameStart)
            containerVC3?.setScore(score)
            containerVC3?.setgamego()
        }
    }
    func didReceivedValueFromContainerLife(_ controller: VisualMemorySecondViewController, value: Int) {
        // 잠시 빨간색 후 다시 파란색
        self.view.backgroundColor = UIColor.systemRed
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.view.backgroundColor = UIColor(named: "background")
        })
        
        life -= value
        if life > 0 {
            lifeLabel.text = "Life | \(life)"
        } else {
            gotoResult()
        }
    }
}

extension VisualMemoryViewController: ContainerVCDelegate3 {
    func didReceivedValueFromContainer(_ controller: VisualMemoryThirdViewController, value: Int) {
        score = value
        scoreLabel.text = "Score | \(score)"
        if value >= 8 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.readyView.alpha = 0
                self.firstView.alpha = 0
                self.secondView.alpha = 0
                self.thirdView.alpha = 0
                self.fourthView.alpha = 1
                self.containerVC4?.setisGameStart(self.isGameStart)
                self.containerVC4?.setScore(self.score)
                self.containerVC4?.setgamego()
            })
        }else if value >= 9 {
            readyView.alpha = 0
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 1
            containerVC4?.setisGameStart(isGameStart)
            containerVC4?.setScore(score)
            containerVC4?.setgamego()
        }
    }
    func didReceivedValueFromContainerLife(_ controller: VisualMemoryThirdViewController, value: Int) {
        // 잠시 빨간색 후 다시 파란색
        self.view.backgroundColor = UIColor.systemRed
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.view.backgroundColor = UIColor(named: "background")
        })
        
        life -= value
        if life > 0 {
            lifeLabel.text = "Life | \(life)"
        } else {
            gotoResult()
        }
    }
}

extension VisualMemoryViewController: ContainerVCDelegate4 {
    func didReceivedValueFromContainer(_ controller: VisualMemoryFourthViewController, value: Int) {
        score = value
        scoreLabel.text = "Score | \(score)"
        if value >= 15 {
            readyView.alpha = 1
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 0
        }
    }
    func didReceivedValueFromContainerLife(_ controller: VisualMemoryFourthViewController, value: Int) {
        // 잠시 빨간색 후 다시 파란색
        self.view.backgroundColor = UIColor.systemRed
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.view.backgroundColor = UIColor(named: "background")
        })
        
        life -= value
        if life > 0 {
            lifeLabel.text = "Life | \(life)"
        } else {
            gotoResult()
        }
    }
}
