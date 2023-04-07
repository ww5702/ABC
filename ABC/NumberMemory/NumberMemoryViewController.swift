//
//  NumberMemoryViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/04.
//

import UIKit

class NumberMemoryViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    var timeEnd: Bool = false
    private var numbercontainerVC: NumberMemoryFirstViewController?
    private var numbercontainerVC2: NumberMemorySecondViewController?
    private var numbercontainerVC3: NumberMemoryRightViewController?
    private var numbercontainerVC4: NumberMemoryWrongViewController?
    
    var answer: Int = 0
    var myAnswer: Int = 0
    var iscorrectTime = false
    var level: Int = 0
    var nextLevelOK: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        firstView.alpha = 1
        secondView.alpha = 0
        thirdView.alpha = 0
        fourthView.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "firstContainer":
            numbercontainerVC = segue.destination as? NumberMemoryFirstViewController
            numbercontainerVC?.delegate = self
            
        case "secondContainer":
            numbercontainerVC2 = segue.destination as? NumberMemorySecondViewController
            numbercontainerVC2?.delegate = self
            
        case "thirdContainer":
            numbercontainerVC3 = segue.destination as? NumberMemoryRightViewController
            numbercontainerVC3?.delegate = self
            
        case "fourthContainer":
            numbercontainerVC4 = segue.destination as? NumberMemoryWrongViewController

        default:
            break
        }
    }



}

extension NumberMemoryViewController: ContainerVCDelegatenumber {
    func didReceivedValueFromContainer(_ controller: NumberMemoryFirstViewController, value: Bool) {
        timeEnd = value
        if timeEnd == true {

        }
    }
    func didReceivedValueFromContainerNum(_ controller: NumberMemoryFirstViewController, value: Int) {
        answer = value
        print("정답지 = \(answer)")
        firstView.alpha = 0
        secondView.alpha = 1
        thirdView.alpha = 0
        fourthView.alpha = 0
        iscorrectTime = true
        numbercontainerVC2?.setAnswer(answer)
        numbercontainerVC2?.iscorrectTime(iscorrectTime)
        numbercontainerVC2?.setgamego()
    }
}

extension NumberMemoryViewController: ContainerVCDelegatenumber2 {
    func didReceivedValueFromContainerNum(_ controller: NumberMemorySecondViewController, value: Int) {
        myAnswer = value
        print("받아온정답 = \(myAnswer)")
        if myAnswer == answer {
            level += 1
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 1
            fourthView.alpha = 0
            numbercontainerVC3?.setAnswer(answer)
            numbercontainerVC3?.setMyAnswer(myAnswer)
            numbercontainerVC3?.setLevel(level)
            numbercontainerVC3?.play()
        } else {
            level += 1
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 1
            numbercontainerVC4?.setAnswer(answer)
            numbercontainerVC4?.setMyAnswer(myAnswer)
            numbercontainerVC4?.setLevel(level)
            numbercontainerVC4?.play()
        }
    }
}

extension NumberMemoryViewController: ContainerVCDelegatenumber3 {
    func didReceivedValueFromContainerisOK(_ controller: NumberMemoryRightViewController, value: Bool) {
        nextLevelOK = value
        if nextLevelOK == true {
            firstView.alpha = 1
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 0
            numbercontainerVC?.setgamego()
        }
    }
}
