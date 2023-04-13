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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scoreLabel.text = "\(seconddata)s : \(milliseconddata)ms"
        // Do any additional setup after loading the view.
        self.explainLabel.text = "Aim Trainer\n당신의 반사신경과 손과 눈의 협응력을 테스트합니다.\n당신의 기록을 넘겨보세요"
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
