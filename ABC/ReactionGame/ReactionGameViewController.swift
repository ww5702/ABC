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
    
    var checkTime = CFAbsoluteTimeGetCurrent()
    var isGameStart = false
    var isColorChange = "gray"
    var countStart: Double = 0.0
    var countEnd: Double = 0.0
    var count = 1
    var color = "gray"
    var reactionarr : [Int] = [1,2,3,4,5]
    var reactionAvg = 0
    
    // time trigger
    var timeTrigger = true
    var realTime = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        touchlabel.text = "준비가 됐다면 GameStart버튼을 눌러 시작하십시오. \n테스트는 연속해서 5회 반복됩니다."
        self.touchlabel.backgroundColor = UIColor.gray
        countlabel.text = "Counting Label"
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
        if reactionarr[indexPath.row] > 5 {
            cell.textLabel?.text = "\(indexPath.row+1) 번째 시도 : " + text + " ms"
        } else {
            cell.textLabel?.text = text + " 번째 시도"
        }
        return cell
    }
    
    
    @IBAction func btnGameStart(_ sender: UIButton) {
        if isGameStart == true {
            alreadyGameStart()
        } else {
            self.isGameStart = true
            self.countlabel.text = "준비중입니다."
            self.touchlabel.text = "빨간 화면이 초록색 화면으로\n변한다면 눌러주세요."
            self.touchlabel.backgroundColor = UIColor.red
            self.isColorChange = "red"
            while(timeTrigger) {
                checkTimeTrigger()
            }
        }
    }
    
    @IBAction func btnGameReset(_ sender: UIButton) {
        // 함수 초기화
        stopTimer()
        self.isColorChange = "gray"
        // 데이터 초기화
        self.reactionarr = [1,2,3,4,5]
        tableView.reloadData()
        self.count = 1
        // text 초기화
        touchlabel.text = "반응속도 테스트 입니다. \nGameStart버튼을 눌러 \n게임을 시작하십시오. \n테스트는 연속해서 5회 반복됩니다."
        self.touchlabel.backgroundColor = UIColor.gray
        countlabel.text = "Counting Label"
        
        // 리셋 완료 문구 출력
        completeReset()
    }
    
    
    func checkTimeTrigger() {
        realTime = Timer.scheduledTimer(timeInterval: 7, target: self, selector: #selector(changecolor), userInfo: nil, repeats: true)
        timeTrigger = false
    }
    func stopTimer() {
        timeTrigger = true
        realTime.invalidate()
        isGameStart = false
    }
    
    @objc func changecolor() {
        let randomTime = Double.random(in: 3.0...5.0)
        self.countlabel.text = "\(count)번째 측정"
        print("count : \(count)")
        print("randomTime : \(randomTime)")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+randomTime) {
            self.touchlabel.backgroundColor = UIColor.green
            self.isColorChange = "green"
            // 색이 바꼈을때부터 시간 측정
            if self.isColorChange == "green" {
                self.countStart = CFAbsoluteTimeGetCurrent()
            }
            print("함수 실행")
            if self.count >= 5 {
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
        // 색이 바뀌기 전에 일찍 누른다면 출력되면서 게임 진행사항들을 전부 초기화
        if self.isColorChange == "red" {
            tooEarlytouch()
            // 함수 초기화
            stopTimer()
            self.isColorChange = "gray"
            // 데이터 초기화
            self.reactionarr = [1,2,3,4,5]
            tableView.reloadData()
            self.count = 1
            // text 초기화
            touchlabel.text = "반응속도 테스트 입니다. \n준비가 된다면 GameStart버튼을 눌러 시작하십시오. \n테스트는 연속해서 5회 반복됩니다."
            self.touchlabel.backgroundColor = UIColor.gray
            countlabel.text = "Counting Label"
        }
    }
    
    // 화면에서 손가락을 떼었을 떄 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let touch = touches.first! as UITouch
        if self.isColorChange == "green" {
            self.countEnd = (CFAbsoluteTimeGetCurrent() - self.countStart)*1000
            reactionarr[count-1] = Int(countEnd)
            reactionAvg += Int(countEnd)
            tableView.reloadData()
            
            // 다시 빨간색으로 변경
            self.touchlabel.backgroundColor = UIColor.red
            self.isColorChange = "red"
            count += 1
            
            if count > 5 {
                reactionAvg /= reactionarr.count
                self.countlabel.text = "\(reactionAvg) ms"
                self.touchlabel.text = "측정이 전부 끝났습니다!!\n평균 속도 : \(reactionAvg) ms 입니다."
                isColorChange = "gray"
                print(reactionarr)
            } else {
                self.countlabel.text = "\(count)번째 측정"
            }
        }
        
    }

    func tooEarlytouch() {
        let tooEarly = UIAlertController(title: "오류", message: "너무 빨리 눌렀습니다!\n운을 기대하지 마세요ㅋ", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        tooEarly.addAction(okAction)
        present(tooEarly,animated: true)
    }
    func alreadyGameStart() {
        let alreadyStart = UIAlertController(title: "오류", message: "이미 게임이 실행중입니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alreadyStart.addAction(okAction)
        present(alreadyStart,animated: true)
    }
    func completeReset() {
        let reset = UIAlertController(title: "정보", message: "게임이 리셋되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        reset.addAction(okAction)
        present(reset,animated: true)
    }
    
    
    @IBAction func infoRankBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ReactionGameScoreViewController") as? ReactionGameScoreViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.data = reactionAvg
            self.present(vc, animated: true)
        }
    }
    
}

