//
//  ChimpTestRightViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/17.
//

import UIKit

protocol ContainerVCDelegateChimp2: AnyObject {
    func didReceivedValueFromContainerNext(_ controller: ChimpTestRightViewController, value: Bool)
}

class ChimpTestRightViewController: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var nextBtnLabel: UIButton!
    
    weak var delegate: ContainerVCDelegateChimp2?
    
    var num: Int = 3
    var life: Int = 0
    var continueLevel = false
    var retry = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        numLabel.text = "asdf"
    }
    

    @IBAction func nextBtn(_ sender: UIButton) {
        if retry == false {
            continueLevel = true
            delegate?.didReceivedValueFromContainerNext(self, value: continueLevel)
        } else {
            // 재도전
            continueLevel = false
            delegate?.didReceivedValueFromContainerNext(self, value: continueLevel)
        }
        
    }
    
    func numCheck(_ value: Int) {
        num += value
        if value == 0 {
            retry = true
        } else {
            retry = false
        }
    }
    func lifeCheck(_ value: Int) {
        life = value
    }
    func settingAgain() {
        numLabel.text = String(num)
        lifeLabel.text = "\(life) of 3"
        if retry == true {
            nextBtnLabel.setTitle("RETRY", for: .normal)
        }
        
    }

    
    func gotoResult() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ChimpTestScoreViewController") as? ChimpTestScoreViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
}
