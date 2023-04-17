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
    @IBOutlet weak var titleLabel: UILabel!
    
    var data = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "결과 페이지"
        self.reactionExplainLabel.text = "당신의 평균 속도는 \(data)ms입니다.\n사람들의 평균 반응속도 : 273ms\n프로게이머의 평균 반응속도 : 150ms\n 기기에 따라 30ms의 \n오차범위가 있을 수 있습니다."
        self.changeTextColor()
        // Do any additional setup after loading the view.
    }
    
    func changeTextColor() {
        guard let text = self.reactionExplainLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 30)
        let attributeString = NSMutableAttributedString(string: text)
                
        //attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "\(data)"))
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "\(data)"))
        self.reactionExplainLabel.attributedText = attributeString
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
