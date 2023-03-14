//
//  GameMainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/14.
//

import UIKit

var images = ["01.png", "02.png"]
class GameMainViewController: UIViewController {

    @IBOutlet var imgReaction: UIImageView!
    @IBOutlet var test: UILabel!
    @IBOutlet var test2: UILabel!
    @IBOutlet var mili: UILabel!
    
    var checkTime = CFAbsoluteTimeGetCurrent()
    
    override func viewDidLoad() {
        imgReaction.image = UIImage(named : images[0])
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    // 터치가 시작될때 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        test.text = "Touches Began"
        mili.text = "측정 시작"
        imgReaction.image = UIImage(named: images[1])
        
        checkTime = CFAbsoluteTimeGetCurrent()
        
    }
    
    // 화면에서 손가락을 떼었을 떄 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        test.text = "Touches Ended"
        var changemilli = (CFAbsoluteTimeGetCurrent() - checkTime)*1000
        mili.text = "소요 시간 : \(Int(changemilli)) ms 입니다."
        imgReaction.image = UIImage(named: images[0])
    }
    
}

