//
//  GameMainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/14.
//

import UIKit

class GameMainViewController: UIViewController {

    @IBOutlet var test: UILabel!
    @IBOutlet var test2: UILabel!
    @IBOutlet var mili: UILabel!
    @IBOutlet var touchlabel: UILabel!
    
    var checkTime = CFAbsoluteTimeGetCurrent()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        touchlabel.text = "반응속도 테스트 입니다. \n준비가 된다면 레이블을 눌러 시작하십시오. \n테스트는 연속해서 5회 반복됩니다."
        self.touchlabel.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeLabel))
        touchlabel.addGestureRecognizer(tapGestureRecognizer)
        
    }
    @objc func changeLabel() {
        var count = 1
        self.touchlabel.text = "\(count)번째 측정을 시작합니다.\n화면이 "
        self.touchlabel.backgroundColor = UIColor.green
        
    }
    
    // 터치가 시작될때 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        test.text = "Touches Began"
        mili.text = "측정 시작"
        
        checkTime = CFAbsoluteTimeGetCurrent()
        
    }
    
    // 화면에서 손가락을 떼었을 떄 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        test.text = "Touches Ended"
        var changemilli = (CFAbsoluteTimeGetCurrent() - checkTime)*1000
        mili.text = "소요 시간 : \(Int(changemilli)) ms 입니다."
    }
    
}

