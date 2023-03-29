//
//  VisualMemoryViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/24.
//

import UIKit

class VisualMemoryViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    // 컨테이너 뷰 컨트롤러를 참조하는 변수 생성
    // 해당 변수가 있어야 VisualMemoryViewController의 아무곳에서 나중에 보낼 타깃을 가리킬수있다.
    private var containerVC: VisualMemoryFirstViewController?
    
    @IBOutlet weak var lifeLabel: UILabel!
    // 자식VC로 부터 받은 값을 표시할 레이블
    @IBOutlet weak var scoreLabel: UILabel!
    
    let WHITE = UIColor.white
    let BLUE = UIColor.blue
    
    var score = 0
    var life = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lifeLabel.text = "Life | \(life)"
        scoreLabel.text = "Score | \(score)"
        
        firstView.alpha = 1
        secondView.alpha = 0

    }

    @IBAction func gameStart(_ sender: Any) {
        firstView.alpha = 1
        secondView.alpha = 0
        // 스코어를 전송
        containerVC?.setScore(score)
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
            
        default:
            break
        }
    }
    

}

// ContainerVCDelegate를 준수하는 확장 구현
extension VisualMemoryViewController: ContainerVCDelegate {
    func didReceivedValueFromContainer(_ controller: VisualMemoryFirstViewController, value: Int) {
        scoreLabel.text = "Score | \(value)"
        if value >= 3 {
            firstView.alpha = 0
            secondView.alpha = 1
        }
    }
}
