//
//  AimTrainerViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/10.
//

import UIKit

class AimTrainerViewController: UIViewController {
    
    
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var touchbtnLabel: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    
    var leftConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    var topConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    
    var randomup : Int = 0
    var randomleft : Int = 0
    var count = 30
    
    var countStart: Double = 0.0
    var countEnd: Double = 0.0
    var checkTime = CFAbsoluteTimeGetCurrent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "Reamining \(count)"

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
        countStart = CFAbsoluteTimeGetCurrent()
        
    }
    
    
    @IBAction func touchBtn(_ sender: UIButton) {
        
        let safeArea = view.safeAreaLayoutGuide
        
        if count >= 1 {
            randomup = Int.random(in: 100...650)
            randomleft = Int.random(in: 0...300)
            print(randomup,randomleft)
            
            count -= 1
            countLabel.text = "Reamining \(count)"
            
            leftConstraint?.isActive = false
            topConstraint?.isActive = false
            //<- 재정의 하기 위해서 isActive를 false로 바꿔주고 다시 true로 한다.
            leftConstraint = touchbtnLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor,constant: CGFloat(randomleft))
            topConstraint = touchbtnLabel.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: CGFloat(randomup))
            
            leftConstraint?.isActive = true
            topConstraint?.isActive = true
            print("눌렀다.")
        } else {
            countEnd = (CFAbsoluteTimeGetCurrent() - countStart) * 1000
            gotoResult()
        }
        
    }
    
    func gotoResult() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AimTrainerScoreViewController") as? AimTrainerScoreViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.data = Int(countEnd)
            self.present(vc, animated: true)
        }
    }
    
}
