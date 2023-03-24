//
//  VisualMemoryExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/24.
//

import UIKit

class VisualMemoryExplainViewController: UIViewController {

    @IBOutlet weak var explainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        explainLabel.text = "매 레벨마다 여러 타일이 흰색으로 깜빡입니다.\n그것들을 기억하고, 타일이 리셋된 후에\n다시 선택하세요!\n\n레벨은 점점 더 어려워집니다\n레벨당 타일 3개를 놓치면\n하나의 목숨을 잃습니다.\n\n최대한 멀리 도전해보세요!"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func okBtn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "VisualMemoryViewController") else {return}
        self.present(nextVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
