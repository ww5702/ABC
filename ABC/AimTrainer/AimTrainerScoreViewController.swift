//
//  AimTrainerScoreViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/12.
//

import UIKit

class AimTrainerScoreViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    var seconddata = 0
    var milliseconddata = 0
    var miss: Double = 0
    var percent: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.explainLabel.text = "Aim Trainer\n당신의 반사신경과 손과 눈의 협응력을 테스트합니다.\n당신의 기록을 넘겨보세요"
        print(miss)
        miss = 30-miss
        percent = (miss/30)*100
        
        self.scoreLabel.text = "\(seconddata)s : \(milliseconddata)ms\n정확도 : \(percent)%"
        print(percent)
    }
    

   
    @IBAction func retryBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AimTrainerViewController") as? AimTrainerViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    
    @IBAction func gohomeBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "GameSelectViewController") as? GameSelectViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    

}
