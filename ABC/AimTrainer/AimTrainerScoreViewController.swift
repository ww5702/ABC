//
//  AimTrainerScoreViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/12.
//

import UIKit
import Lottie

class AimTrainerScoreViewController: UIViewController {
    let dbHelper = DBHelper.shared
    var userName: String?

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    private var animationView: LottieAnimationView?
    
    var mindata = 0
    var seconddata = 0
    var milliseconddata = 0
    var percentstring = ""
    var miss: Double = 0
    var percent: Double = 0
    
    var inputdata: Int = 0
    var versusData: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.explainLabel.text = "Aim Trainer\n당신의 반사신경과 손과 눈의 협응력을 테스트합니다.\n당신의 기록을 넘겨보세요"

        miss = 30-miss
        percent = (miss/30)*100
        percentstring = String(format: "%.1f", percent)
    
        if mindata >= 1 {
            if seconddata <= 10 {
                self.scoreLabel.text = "\(mindata):0\(seconddata):\(milliseconddata)\n정확도 : \(percentstring)%"
            } else {
                self.scoreLabel.text = "\(mindata):\(seconddata):\(milliseconddata)\n정확도 : \(percentstring)%"
            }
        } else {
            if seconddata <= 10 {
                self.scoreLabel.text = "00:0\(seconddata):\(milliseconddata)\n정확도 : \(percentstring)%"
            } else {
                self.scoreLabel.text = "00:\(seconddata):\(milliseconddata)\n정확도 : \(percentstring)%"
            }
        }
        
        
        if percent >= 90 {
            if mindata < 1 && seconddata <= 15{
                trophyAnimation(x: "champion_trophy")
                textAnimation(x: "!!CHAMPION!!\n몰라봤습니다...특등사수셨군요!?")
            } else if mindata < 1 && seconddata <= 20 {
                trophyAnimation(x: "gold_trophy")
                textAnimation(x: "GREAT!\n최고는 아니지만 이정도면\n어디가서 꿀리진 않겠어요!")
            } else if mindata < 1 && seconddata <= 30 {
                trophyAnimation(x: "silver_trophy")
                textAnimation(x: "NOT BAD\n나쁘진 않지만 좋지도 않은 그저 그런 성적...이랄까요?")
            } else {
                trophyAnimation(x: "bronze_trophy")
                textAnimation(x: "어르신 또이러신다..\n 이런게임 말고 장기나 바둑같은거 하시라니까요..")
            }
        } else {
            trophyAnimation(x: "walkingToy")
            textAnimation(x: "일단 기록이 이렇긴 한데...\n정확도가 영...")
        }
    
        changeTextColor()
        inputRecord()
    }
    
    func trophyAnimation(x : String) {
        animationView = .init(name: x)
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 250)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
    }
    func textAnimation(x : String) {
        let explainText = x
        explainLabel.text = ""
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    func changeTextColor() {
        guard let text = self.scoreLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "\(milliseconddata)"))
        self.scoreLabel.attributedText = attributeString
    }

   
    @IBAction func retryBtn(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "AimTrainerExplainViewController") as? AimTrainerExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    
    @IBAction func gohomeBtn(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "GameSelectViewController") as? GameSelectViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
        }
    
    func inputRecord() {
        versusData = dbHelper.readRecordData(name: userName!, section: "aim")
        print("기존 = \(versusData)")
        print("내 기록 = \(seconddata).\(milliseconddata)")
        if versusData == 0 {
            dbHelper.insertData(name: "\(userName!)", value: milliseconddata, section: "aim")
            print("새 기록 추가")
        } else if milliseconddata > versusData{
            dbHelper.updateDate(name: "\(userName!)", value: milliseconddata, section: "aim")
            print("기록 갱신")
        } else {
            print("기록 갱신 실패!")
        }
    }
}
