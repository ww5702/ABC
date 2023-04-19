//
//  AimTrainerViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/10.
//

import UIKit
import AVFoundation

class AimTrainerViewController: UIViewController {
    
    
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var touchbtnLabel: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet var touchView: UIView!
    
    
    var leftConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    var topConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    
    var randomup : Int = 0
    var randomleft : Int = 0
    var count = 30
    var miss = 0
    
    var countMin: Double = 0.0
    var countSecond: Double = 0.0
    var countMilliSecond: Double = 0.0
    var checkTime = CFAbsoluteTimeGetCurrent()
    
    var timer: Timer!
    var startTime = Date()
    var min = 0
    var second = 0
    var milliSecond = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "Target \(count)"
        timerLabel.text = "TIME 00:00"

        touchbtnLabel.layer.cornerRadius = touchbtnLabel.layer.frame.size.width/2
        touchbtnLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        touchbtnLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //touchbtnLabel.layer.cornerRadius = 0.5 * touchbtnLabel.bounds.size.width
        touchbtnLabel.clipsToBounds = true
        touchbtnLabel.layer.isHidden = true
        
        
        
    }
    
    @IBAction func startbtn(_ sender: UIButton) {
        touchbtnLabel.layer.isHidden = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        randomup = Int.random(in: 100...650)
        randomleft = Int.random(in: 0...300)
        print(randomup,randomleft)
        
        touchbtnLabel.backgroundColor = UIColor.orange
        touchbtnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = touchbtnLabel.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: CGFloat(randomup))
        topConstraint?.isActive = true
        
        leftConstraint = touchbtnLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor,constant: CGFloat(randomleft))
        leftConstraint?.isActive = true
        
        // 시작 후 버튼 숨기기
        startLabel.layer.isHidden = true
        
        // 타이머 시작
        print("타이머 시작")
        self.startTime = Date()
        self.timer = Timer.scheduledTimer(timeInterval: 0.001,
                                          target: self,
                                          selector: #selector(timeUp),
                                          userInfo: nil,
                                          repeats: true)

        // 잘못터치 (miss) 기능 시작 
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(misstouch))
        touchView.isUserInteractionEnabled = true
        touchView.addGestureRecognizer(tapGestureRecognizer)
    
    }
    @objc
        private func timeUp() {
            let timeInterval = Date().timeIntervalSince(self.startTime)
            min = (Int)(fmod((timeInterval/60), 60)) // 초를 60으로 나누어 분을 구한다
            second = (Int)(fmod(timeInterval, 60)) // 초를 구한다
            milliSecond = (Int)((timeInterval - floor(timeInterval))*1000)
            
            if min >= 1 {
                self.timerLabel.text = "\(min):\(second):\(milliSecond)"
            } else {
                self.timerLabel.text = "\(second):\(milliSecond)"
            }
        }
    
    @IBAction func touchBtn(_ sender: UIButton) {
        let safeArea = view.safeAreaLayoutGuide
        
        if count > 1 {
            randomup = Int.random(in: 100...650)
            randomleft = Int.random(in: 0...300)
            print(randomup,randomleft)
            
            count -= 1
            countLabel.text = "Target \(count)"
            
            leftConstraint?.isActive = false
            topConstraint?.isActive = false
            //<- 재정의 하기 위해서 isActive를 false로 바꿔주고 다시 true로 한다.
            leftConstraint = touchbtnLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor,constant: CGFloat(randomleft))
            topConstraint = touchbtnLabel.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: CGFloat(randomup))
            
            leftConstraint?.isActive = true
            topConstraint?.isActive = true
            print("눌렀다.")
        } else {
            print("기록")
            countMin = Double(min)
            countSecond = Double(second)
            countMilliSecond = Double(milliSecond)
            gotoResult()
        }
        
    }
    
    @objc func misstouch() {
        miss += 1
        print("miss \(miss)")
    }
    
    func gotoResult() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AimTrainerScoreViewController") as? AimTrainerScoreViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.mindata = Int(countMin)
            vc.seconddata = Int(countSecond)
            vc.milliseconddata = Int(countMilliSecond)
            vc.miss = Double(miss)
            self.present(vc, animated: true)
        }
    }
    
}
