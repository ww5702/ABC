//
//  GameMainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/14.
//

import UIKit

class ReactionGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var countlabel: UILabel!
    @IBOutlet var touchlabel: UILabel!
    @IBOutlet var touchView: UIView!
    @IBOutlet weak var gameStartLabel: UIButton!
    
    var count = 1
    
    var reactionarr : [Int] = [1,2,3,4,5]
    var reactionAvg = 0
    
    var randomTime : Double = 0.0
    
    var isGameStart = false
    var testcolorchange = false
    var testgogameend = false
    
    var countSecond: Double = 0.0
    var countMilliSecond: Double = 0.0
    var timer: Timer!
    var startTime = Date()
    var second = 0
    var milliSecond = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        touchlabel.text = "PRESS\nGame Start\nBUTTON"
        self.touchlabel.backgroundColor = UIColor.gray
        countlabel.text = "Counting Label"
        // Do any additional setup after loading the view.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchfunc))
        touchView.isUserInteractionEnabled = true
        touchView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text:String = String(reactionarr[indexPath.row])
        if reactionarr[indexPath.row] > 5 {
            cell.textLabel?.text = "\(indexPath.row+1) 번째 시도 : " + text + " ms"
        } else {
            cell.textLabel?.text = text + " 번째 시도"
        }
        return cell
    }
    
    
    @IBAction func btnGameStart(_ sender: UIButton) {
        gameStartLabel.layer.isHidden = true
        self.isGameStart = true
        self.testgogameend = false
        self.countlabel.text = "준비중입니다."
        self.touchlabel.text = "초록화면으로 변하면\n눌러주세요"
        self.touchlabel.backgroundColor = UIColor.red
        gamestart()
    }
    func gamestart() {
        randomTime = Double.random(in: 3.0...5.0)
        if testgogameend == false {
            self.countlabel.text = "\(count)번째 측정"
            print("count : \(count)")
            print("randomTime : \(randomTime)")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+randomTime) {
                self.touchlabel.backgroundColor = UIColor.green
                self.testcolorchange = true
                // 색이 바꼈을때부터 시간 측정
                if self.testcolorchange == true {
                    print("타이머 시작")
                    self.startTime = Date()
                    self.timer = Timer.scheduledTimer(timeInterval: 0.001,
                                                      target: self,
                                                      selector: #selector(self.timeUp),
                                                      userInfo: nil,
                                                      repeats: true)
                }
            }
        }
        
    }
    @objc func touchfunc() {
        print("눌렸습니다.")
        if isGameStart == true {
            if testcolorchange == true {
                countSecond = Double(second)
                countMilliSecond = Double(milliSecond)
                
                print("test결과 \(countMilliSecond)")
                
                reactionarr[count-1] = Int(countMilliSecond)
                reactionAvg += Int(countMilliSecond)
                tableView.reloadData()
                
                
                //초기화
                self.touchlabel.backgroundColor = UIColor.red
                self.timer.invalidate() // 타이머 초기화
                
                if count < 5 {
                    count += 1
                    testcolorchange = false
                    gamestart()
                } else {
                    reactionAvg /= reactionarr.count
                    print(reactionAvg)
                    if let vc = storyboard?.instantiateViewController(withIdentifier: "ReactionGameScoreViewController") as? ReactionGameScoreViewController {
                        vc.modalPresentationStyle = .fullScreen
                        vc.data = reactionAvg
                        self.present(vc, animated: true)
                    }
                }
                
            } else {
                print("너무 빨리 눌렀습니다.")
                tooEarlytouch()
                testgogameend = true
                testcolorchange = false
                isGameStart = false
                gameStartLabel.layer.isHidden = false
                self.reactionarr = [1,2,3,4,5]
                tableView.reloadData()
                self.count = 1
                touchlabel.text = "PRESS\nGame Start\nBUTTON"
                self.touchlabel.backgroundColor = UIColor.gray
                countlabel.text = "Counting Label"
            }
        }
    }
    
    @objc
        private func timeUp() {
            let timeInterval = Date().timeIntervalSince(self.startTime)
            second = (Int)(fmod(timeInterval, 60)) // 초를 구한다
            milliSecond = (Int)((timeInterval - floor(timeInterval))*1000)
        }
    
    func tooEarlytouch() {
        let tooEarly = UIAlertController(title: "오류", message: "너무 빨리 눌렀습니다!\n게임이 중단됩니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        tooEarly.addAction(okAction)
        present(tooEarly,animated: true)
    }
    
}

