//
//  VerbalMemoryScoreViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/21.
//

import UIKit

class VerbalMemoryScoreViewController: UIViewController {
    
    
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var data = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scoreLabel.text = "\(data)점"
        self.explainLabel.text = "인간은 평균적으로\n얼마나 기억하는지 ~~ \n사진과 통계 자료 "
    }
    

    @IBAction func retryBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "VerbalMemoryViewController") as? VerbalMemoryViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func homeBton(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "GameSelectViewController") as? GameSelectViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }


}
