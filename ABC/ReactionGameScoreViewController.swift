//
//  RelactionGameRankViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/21.
//

import UIKit

class ReactionGameScoreViewController: UIViewController {
    
    
    @IBOutlet weak var reactionImgView: UIImageView!
    @IBOutlet weak var reactionExplainLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func retryBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ReactionGameViewController") as? ReactionGameViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }

    @IBAction func homeBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "GameSelectViewController") as? GameSelectViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}
