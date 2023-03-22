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
        
        self.changeTextColor()
    }
    
    func changeTextColor() {
        guard let text = self.scoreLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 50)
        let attributeString = NSMutableAttributedString(string: text)
                
        attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "\(data)"))
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "\(data)"))
        self.scoreLabel.attributedText = attributeString
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
