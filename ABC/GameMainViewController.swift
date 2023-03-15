//
//  GameMainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/14.
//

import UIKit

class GameMainViewController: UIViewController {

    @IBOutlet var mili: UILabel!
    @IBOutlet var countlabel: UILabel!
    @IBOutlet var touchlabel: UILabel!
    
    var checkTime = CFAbsoluteTimeGetCurrent()
    var checkEnd = true
    var isGameStart = false
    var count = 1
    var color = "gray"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        touchlabel.text = "반응속도 테스트 입니다. \n준비가 된다면 GameStart버튼을 눌러 시작하십시오. \n테스트는 연속해서 5회 반복됩니다."
        self.touchlabel.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
        
        /*
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeLabel))
        touchlabel.addGestureRecognizer(tapGestureRecognizer)*/
    }
    
    
    @IBAction func btnGameStart(_ sender: UIButton) {
        self.countlabel.text = "\(count)번째 측정"
        self.touchlabel.text = "빨간 화면이 초록색 화면으로\n변한다면 눌러주세요."
        self.touchlabel.backgroundColor = UIColor.red
        if isGameStart == true {
            let alert = UIAlertController(title: "경고", message: "이미 게임이 진행중입니다.", preferredStyle: UIAlertController.Style.alert)
            let check = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(check)
        } else {
            waitend()
        }
    }
    
    func changecolor() {
        self.isGameStart = true
        self.checkEnd = false
        let randomTime = Double.random(in: 3.0...8.0)
        print("randomTime : \(randomTime)")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+randomTime) {
            self.touchlabel.backgroundColor = UIColor.green
            self.color = "green"
            print("함수 실행")
        }
    }
    
    func waitend() {
        changecolor()
    }
    /*
    @objc func changeLabel() {
        var color = "gray"
        
        var randomTime = Double.random(in: 3.0...8.0)
        self.countlabel.text = "\(count)번째 측정을 시작합니다.\n화면이 "
        self.touchlabel.text = "빨간 화면이 초록색 화면으로 변한다면 눌러주세요."
        self.touchlabel.backgroundColor = UIColor.red
        color = "red"
        
        if color == "red" {
            self.countlabel.text = "실패"
            self.touchlabel.text = "너무 빨리 누르셨습니다. \n 다시 시작해주세요."
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+randomTime) {
            self.checkTime = CFAbsoluteTimeGetCurrent()
            self.touchlabel.backgroundColor = UIColor.green
            color = "green"
            var changemilli = (CFAbsoluteTimeGetCurrent() - self.checkTime)*1000
            self.mili.text = "소요 시간 : \(Int(changemilli)) ms 입니다."
        }
        
    }*/
    
    
    // 터치가 시작될때 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let touch = touches.first! as UITouch
        if self.color == "green" {
            self.checkTime = CFAbsoluteTimeGetCurrent()
        }
    }
    
    // 화면에서 손가락을 떼었을 떄 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let touch = touches.first! as UITouch
        if self.color == "green" {
            let changemilli = (CFAbsoluteTimeGetCurrent() - self.checkTime)*1000
            self.mili.text = "소요 시간 : \(Int(changemilli)) ms 입니다."
            
            // 다시 빨간색으로 변경
            self.touchlabel.backgroundColor = UIColor.red
            self.color = "red"
            self.checkEnd = true
            count += 1
        }
        
    }
    

}

