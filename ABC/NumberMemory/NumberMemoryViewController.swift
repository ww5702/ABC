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
    
    var timeEnd: Bool = false
    private var numbercontainerVC: NumberMemoryFirstViewController?
    private var numbercontainerVC2: NumberMemorySecondViewController?
    
    var answer: Int = 0
    var myAnswer: Int = 0
    var iscorrectTime = false

    override func viewDidLoad() {
        super.viewDidLoad()

        firstView.alpha = 1
        secondView.alpha = 0
        
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
        print("asdf\(answer)")
        firstView.alpha = 0
        secondView.alpha = 1
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
    }
}
