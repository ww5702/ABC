//
//  ChimpTestViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/14.
//

import UIKit

class ChimpTestViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    private var chimpcontainerVC: ChimpTestFirstViewController?
    private var chimpcontainerVC2: ChimpTestRightViewController?
    var goNextLevel: Bool = false   // 결과페이지로 넘어가야하는 변수
    var continueLevel: Bool = false // 다음레벨로 넘어가야하는 변수
    
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var explainLabel: UILabel!
    var life: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        explainLabel.text = "PRESS\nSTART\nBUTTON"

        firstView.alpha = 0
        secondView.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "firstContainer":
            chimpcontainerVC = segue.destination as? ChimpTestFirstViewController
            chimpcontainerVC?.delegate = self
        case "secondContainer":
            chimpcontainerVC2 = segue.destination as? ChimpTestRightViewController
            chimpcontainerVC2?.delegate = self
        default:
            break
        }
    }
    
    @IBAction func startBtn(_ sender: UIButton) {
        // 버튼 숨기고, 게임시작
        startLabel.layer.isHidden = true
        explainLabel.layer.isHidden = true
        chimpcontainerVC?.setStart()
        firstView.alpha = 1
        secondView.alpha = 0
    }
    
}

extension ChimpTestViewController: ContainerVCDelegateChimp {
    func didReceivedValueFromContainerBool(_ controller: ChimpTestFirstViewController, value: Bool) {
        goNextLevel = value
        if goNextLevel == true {
            firstView.alpha = 0
            secondView.alpha = 1
            chimpcontainerVC2?.numCheck(1) // 정답페이지 넘어갈때마다 num 갯수 체크
            chimpcontainerVC2?.settingAgain() // text 재정렬
        }
    }
    func didReceivedValueFromContainerLife(_ controller: ChimpTestFirstViewController, value: Int) {
        life += value
        firstView.alpha = 0
        secondView.alpha = 1
        chimpcontainerVC2?.lifeCheck(life)
        chimpcontainerVC2?.settingAgain()
    }
}

extension ChimpTestViewController: ContainerVCDelegateChimp2 {
    func didReceivedValueFromContainerNext(_ controller: ChimpTestRightViewController, value: Bool) {
        
    }
}
