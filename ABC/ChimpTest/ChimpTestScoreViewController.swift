//
//  ChimpTestScoreViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/14.
//

import UIKit
import Lottie

class ChimpTestScoreViewController: UIViewController {
    let dbHelper = DBHelper.shared
    var userName: String?
    var isFirstTimeRecord: Bool?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    private var animationView: LottieAnimationView?
    
    let RED = UIColor(named: "turnRed")
    
    var data = 0
    var versusData: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        print(userName!)
        
        if data < 5 {
            trophyAnimation(x: "bronze_trophy")
            scoreLabel.text = "\(data) 점"
            textAnimation(x: "안타까워요..근데 그거 아시나요?\n90%의 침팬지는 9자리를 기억할 수 있습니다.\n아니 그냥 그렇다구요ㅎㅎ")
        } else if data <= 9 {
            trophyAnimation(x: "silver_trophy")
            scoreLabel.text = "\(data) 점"
            textAnimation(x: "흐으음...\n90%의 침팬지는 9자리를 기억할 수 있습니다.\n 침팬지 정도는 되시는군요!")
        } else if data <= 13 {
            trophyAnimation(x: "gold_trophy")
            scoreLabel.text = "\(data) 점"
            textAnimation(x: "GREAT!\n최고는 아니지만 이정도면 어디가서 꿀리진 않겠어요!")
        } else {
            trophyAnimation(x: "champion_trophy")
            scoreLabel.text = "\(data) 점"
            textAnimation(x: "!!CHAMPION!!\n이보다 좋은 결과는 없을거에요")
        }
        inputRecord()
        changeTextColor()
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
        let font = UIFont.systemFont(ofSize: 70, weight: .semibold)
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "\(data)"))
        self.scoreLabel.attributedText = attributeString
    }
    
    @IBAction func retryBtn(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ChimpTestViewController") as? ChimpTestViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        vc.isFirstTimeRecord = isFirstTimeRecord!
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    @IBAction func gohomeBtn(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "GameSelectViewController") as? GameSelectViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        vc.isFirstTimeRecord = isFirstTimeRecord!
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    func inputRecord() {
        versusData = dbHelper.readRecordData(name: userName!, section: "chimp")
        if versusData == 0 {
            if isFirstTimeRecord == true {
                dbHelper.insertData(name: "\(userName!)", value: data, section: "chimp")
                print("첫 db 기록!")
                isFirstTimeRecord = false
            } else {
                dbHelper.updateDate(name: "\(userName!)", value: data, section: "chimp")
            }
            print("새 기록 추가")
        } else if data > versusData{
            dbHelper.updateDate(name: "\(userName!)", value: data, section: "chimp")
            print("기록 갱신")
        } else {
            print("기록 갱신 실패!")
        }
    }

}
