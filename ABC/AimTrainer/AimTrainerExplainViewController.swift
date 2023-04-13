//
//  AimTrainerExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/10.
//

import UIKit

class AimTrainerExplainViewController: UIViewController {

    @IBOutlet weak var explainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        explainLabel.text = "최대한 빠르고 정확하게 타겟을 클릭하세요\n총 30개의 타겟을 클릭하면\n누적 시간이 출력됩니다."
        changeTextColor()
    }
    

    func changeTextColor() {
        guard let text = self.explainLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 30)
        let attributeString = NSMutableAttributedString(string: text)
        
        
        attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "30"))
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "30"))
        self.explainLabel.attributedText = attributeString
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
