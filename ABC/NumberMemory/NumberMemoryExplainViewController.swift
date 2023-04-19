//
//  NumberMemoryExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/04.
//

import UIKit

class NumberMemoryExplainViewController: UIViewController {
    
    @IBOutlet weak var explainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        explainLabel.text = ""
        let explainText = "보통 사람은 한번에 7개의 숫자를 기억할 수 있습니다.\n당신은 더 외울 수 있습니까?"
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
    }

    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
