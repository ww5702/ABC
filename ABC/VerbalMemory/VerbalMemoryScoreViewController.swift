//
//  VerbalMemoryScoreViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/21.
//

import Lottie
import UIKit

class VerbalMemoryScoreViewController: UIViewController {
    let dbHelper = DBHelper.shared
    var userName: String?
    var isFirstTimeRecord: Bool?
    
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    private var animationView: LottieAnimationView?
    var data = 60
    var versusData: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scoreLabel.text = "\(data) words"
        self.changeTextColor()
        
        if data < 20 {
            trophyAnimation(x: "bronze_trophy")
            scoreLabel.text = "\(data) 점"
            textAnimation(x: "\(data)개..?\n그래요 영어단어라서 이렇게 못한거라고 위안하죠\n암 그렇고말고!")
        } else if data <= 30 {
            trophyAnimation(x: "silver_trophy")
            scoreLabel.text = "\(data) 점"
            textAnimation(x: "흐으음...\n대부분의 사람들은 30개 정도의 단어를 기억합니다.\n 즉 '평균'은 되신다는 소리죠!")
        } else if data <= 60 {
            trophyAnimation(x: "gold_trophy")
            scoreLabel.text = "\(data) 점"
            textAnimation(x: "GREAT!\n최고는 아니지만 이정도면 어디가서 꿀리진 않겠어요!")
        } else {
            trophyAnimation(x: "champion_trophy")
            scoreLabel.text = "\(data) 점"
            textAnimation(x: "!!CHAMPION!!\n믿기지 않는 기억력!\n이보다 좋은 결과는 없을거에요")
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
    func changeTextColor() {
        guard let text = self.scoreLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 50)
        let attributeString = NSMutableAttributedString(string: text)
                
        //attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "\(data)"))
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "\(data)"))
        self.scoreLabel.attributedText = attributeString
    }

    @IBAction func retryBtn(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "VerbalMemoryViewController") as? VerbalMemoryViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    @IBAction func homeBton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "GameSelectViewController") as? GameSelectViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    func inputRecord() {
        versusData = dbHelper.readRecordData(name: userName!, section: "verbal")
        if data > versusData{
            dbHelper.updateDate(name: "\(userName!)", value: data, section: "verbal")
            print("기록 갱신")
        }
    }

}
