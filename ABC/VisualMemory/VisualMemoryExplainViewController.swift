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
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        super.viewDidLoad()
        explainLabel.text = "매 레벨마다 여러 타일이 흰색으로 깜빡입니다.\n그것들을 기억하고, 타일이 리셋된 후에\n다시 선택하세요!\n\n레벨은 점점 더 어려워집니다\n레벨당 타일 3개를 놓치면\n하나의 목숨을 잃습니다.\n\n최대한 멀리 도전해보세요!"
        // Do any additional setup after loading the view.
    }

    @IBAction func backbtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
