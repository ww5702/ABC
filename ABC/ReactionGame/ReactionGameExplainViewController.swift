//
//  ReactionGameExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/05.
//

import UIKit

class ReactionGameExplainViewController: UIViewController {

    
    @IBOutlet weak var explainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        explainLabel.text = ""
        let explainText = "총 5번의 테스트가 진행됩니다.\n화면이 초록색으로 변한다면\n반응하여 터치하세요."
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white

        // Do any additional setup after loading the view.
    }
    

//    @IBAction func startbtn(_ sender: UIButton) {
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ReactionGameViewController") else {return}
//        self.present(nextVC, animated: true)
//    }

    @IBAction func backbtn(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil)
    }
}
