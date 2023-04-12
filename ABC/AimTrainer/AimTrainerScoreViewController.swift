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
    
    var data = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scoreLabel.text = "\(data) ms"
        // Do any additional setup after loading the view.
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
