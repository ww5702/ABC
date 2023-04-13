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
    var percentstring = ""
    var miss: Double = 0
    var percent: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.explainLabel.text = "Aim Trainer\n당신의 반사신경과 손과 눈의 협응력을 테스트합니다.\n당신의 기록을 넘겨보세요"

        miss = 30-miss
        percent = (miss/30)*100
        percentstring = String(format: "%.1f", percent)
        
        if seconddata <= 10 {
            self.scoreLabel.text = "0\(seconddata):\(milliseconddata)\n정확도 : \(percentstring)%"
        } else {
            self.scoreLabel.text = "\(seconddata):\(milliseconddata)\n정확도 : \(percentstring)%"
        }
        

        changeTextColor()
    }
    
    func changeTextColor() {
        guard let text = self.scoreLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "\(milliseconddata)"))
        self.scoreLabel.attributedText = attributeString
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
