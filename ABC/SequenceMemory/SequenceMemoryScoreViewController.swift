//
//  SequenceMemoryScoreViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/26.
//

import Lottie
import UIKit

class SequenceMemoryScoreViewController: UIViewController {
    let dbHelper = DBHelper.shared
    var userName: String?
    var isFirstTimeRecord: Bool?
    
    var data = 0
    var versusData: Int = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data -= 1
        
        if data < 5 {
            trophyAnimation(x: "bronze_trophy")
            scoreLabel.text = "Level \(data)"
            textAnimation(x: "전 다 이해해요!\n기억력이 뭐 남들보다 현저히 떨어질수도 있지\n괜찮아요 괜찮아")
        } else if data <= 8 {
            trophyAnimation(x: "silver_trophy")
            scoreLabel.text = "Level \(data)"
            textAnimation(x: "NOT BAD\n진짜 말그대로 나쁘지도 않고 좋지도 않은\n그저 그런 점수랄까..?")
        } else if data <= 16 {
            trophyAnimation(x: "gold_trophy")
            scoreLabel.text = "Level \(data)"
            textAnimation(x: "GREAT!\n최고는 아니지만 이정도면\n어디가서 꿀리진 않겠어요!")
        } else {
            trophyAnimation(x: "champion_trophy")
            scoreLabel.text = "Level \(data)"
            textAnimation(x: "!!CHAMPION!!\n멘사 회원이시면 말씀을 하시지..\n이보다 좋은 결과는 없을거에요")
        }
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
    
    @IBAction func retryBtn(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SequenceMemoryViewController") as? SequenceMemoryViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        vc.isFirstTimeRecord = isFirstTimeRecord!
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    @IBAction func gotoHome(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "GameSelectViewController") as? GameSelectViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        vc.isFirstTimeRecord = isFirstTimeRecord!
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    func inputRecord() {
        versusData = dbHelper.readRecordData(name: userName!, section: "sequence")
        if versusData == 0 {
            if isFirstTimeRecord == true {
                dbHelper.insertData(name: "\(userName!)", value: data, section: "sequence")
                print("첫 db 기록!")
                isFirstTimeRecord = false
            } else {
                dbHelper.updateDate(name: "\(userName!)", value: data, section: "sequence")
            }
            print("새 기록 추가")
        } else if data > versusData{
            dbHelper.updateDate(name: "\(userName!)", value: data, section: "sequence")
            print("기록 갱신")
        } else {
            print("기록 갱신 실패!")
        }
    }
}
