//
//  ViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlayGame(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "GameSelectViewController")
        // 전체 화면
        vcName?.modalPresentationStyle = .fullScreen
        // 전환 애니메이션
        vcName?.modalTransitionStyle = .crossDissolve
        self.present(vcName!, animated: true, completion: nil)
    }
    
}

