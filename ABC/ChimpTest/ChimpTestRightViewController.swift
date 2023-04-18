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
    
    weak var delegate: ContainerVCDelegateChimp2?
    
    var num: Int = 3
    var life: Int = 0
    var continueLevel = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        numLabel.text = "asdf"
    }
    

    @IBAction func nextBtn(_ sender: UIButton) {
        continueLevel = true
        delegate?.didReceivedValueFromContainerNext(self, value: continueLevel)
    }
    
    func numCheck(_ value: Int) {
        num += value
    }
    func lifeCheck(_ value: Int) {
        life = value
    }
    func settingAgain() {
        numLabel.text = String(num)
        lifeLabel.text = "\(life) of 3"
    }

    
    func gotoResult() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ChimpTestScoreViewController") as? ChimpTestScoreViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
}
