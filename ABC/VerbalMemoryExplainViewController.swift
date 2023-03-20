//
//  VerbalMemoryViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/20.
//

import UIKit

class VerbalMemoryExplainViewController: UIViewController {
    
    
    
    @IBOutlet weak var explainImage: UIImageView!
    @IBOutlet weak var explainLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        explainLabel.text = "한번에 하나씩 단어가 표시됩니다.\n본적이 있는 단어라면 SEEN\n새로운 단어라면 NEW를 클릭하세요"
        
        self.changeTextColor()

        // Do any additional setup after loading the view.
    }
    func changeTextColor() {
        guard let text = self.explainLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 30)
        let attributeString = NSMutableAttributedString(string: text)
        
        
        attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "SEEN"))
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "SEEN"))
        attributeString.addAttribute(.foregroundColor, value: UIColor.blue, range: (text as NSString).range(of: "NEW"))
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "NEW"))
        self.explainLabel.attributedText = attributeString
    }
    
    @IBAction func gotoGameButton(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "VerbalMemoryViewController") else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
