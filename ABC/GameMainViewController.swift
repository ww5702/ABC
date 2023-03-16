//
//  GameMainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/14.
//

import UIKit

class GameMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var countlabel: UILabel!
    @IBOutlet var touchlabel: UILabel!
    
    var checkTime = CFAbsoluteTimeGetCurrent()
    var isGameStart = false
    var isColorChange = false
    var count = 1
    var color = "gray"
    var reactionarr : [Int] = [1,2,3,4,5]
    
    // time trigger
    var timeTrigger = true
    var realTime = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        touchlabel.text = "반응속도 테스트 입니다. \n준비가 된다면 GameStart버튼을 눌러 시작하십시오. \n테스트는 연속해서 5회 반복됩니다."
        self.touchlabel.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
        
        /*
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeLabel))
        touchlabel.addGestureRecognizer(tapGestureRecognizer)*/
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text:String = String(reactionarr[indexPath.row])
        cell.textLabel?.text = text
        return cell
    }
    
    
    @IBAction func btnGameStart(_ sender: UIButton) {
        if isGameStart == true {
            let alert = UIAlertController(title: "경고", message: "이미 게임이 진행중입니다.", preferredStyle: UIAlertController.Style.alert)
            let check = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(check)
        }
        self.countlabel.text = "준비중입니다."
        self.touchlabel.text = "빨간 화면이 초록색 화면으로\n변한다면 눌러주세요."
        self.touchlabel.backgroundColor = UIColor.red
        while(timeTrigger) {
            checkTimeTrigger()
        }
    }
    func checkTimeTrigger() {
        realTime = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(changecolor), userInfo: nil, repeats: true)
        timeTrigger = false
    }
    func stopTimer() {
        timeTrigger = true
        realTime.invalidate()
        isGameStart = false
    }
    
    @objc func changecolor() {
        self.isGameStart = true
        let randomTime = Double.random(in: 3.0...8.0)
        self.countlabel.text = "\(count)번째 측정"
        print("count : \(count)")
        print("randomTime : \(randomTime)")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+randomTime) {
            self.touchlabel.backgroundColor = UIColor.green
            self.isColorChange = true
            print("함수 실행")
            if self.count >= 2 {
                self.stopTimer()
            }
        }
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
        if self.isColorChange == true {
            self.checkTime = CFAbsoluteTimeGetCurrent()
        }
    }
    
    // 화면에서 손가락을 떼었을 떄 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let touch = touches.first! as UITouch
        if self.isColorChange == true {
            let changemilli = (CFAbsoluteTimeGetCurrent() - self.checkTime)*1000
            reactionarr[count-1] = Int(changemilli)
            
            // 다시 빨간색으로 변경
            self.touchlabel.backgroundColor = UIColor.red
            self.isColorChange = false
            count += 1
            
            if count > 2 {
                self.touchlabel.text = "측정이 전부 끝났습니다!!"
                print(reactionarr)
            }
        }
        
    }
    

}

