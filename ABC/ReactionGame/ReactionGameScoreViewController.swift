//
//  RelactionGameRankViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/21.
//

import Lottie
import UIKit

class ReactionGameScoreViewController: UIViewController {
    let dbHelper = DBHelper.shared
    var userName: String?
    
    @IBOutlet weak var reactionImgView: UIImageView!
    @IBOutlet weak var reactionExplainLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    private var animationView: LottieAnimationView?
    
    var data = 0
    var versusData: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if data < 280 {
            trophyAnimation(x: "champion_trophy")
            titleLabel.text = "\(data) ms"
            textAnimation(x: "말도안돼!!\n혹시 프로게이머이신가요??\n만약 아니라면 프로게이머에 도전해보시는건 어떠신가요")
        } else if data <= 300 {
            trophyAnimation(x: "gold_trophy")
            titleLabel.text = "\(data) ms"
            textAnimation(x: "오호\n이정도면 어디가서 반응속도 빠르다고\n말할정도는 되겠는데요")
        } else if data <= 330 {
            trophyAnimation(x: "silver_trophy")
            titleLabel.text = "\(data) ms"
            textAnimation(x: "흐음..\n느리지도 빠르지도 않은 사람다운 반응속도랄까요")
        } else {
            trophyAnimation(x: "bronze_trophy")
            titleLabel.text = "\(data) 점"
            textAnimation(x: "괜찮아요\n나이가 들수록 반응속도가 느려지는건\n당연한 결과라고 하니까요ㅎㅎ")
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
        reactionExplainLabel.text = ""
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.reactionExplainLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    

    @IBAction func retryBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ReactionGameViewController") as? ReactionGameViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.userName = userName
            self.present(vc, animated: true)
        }
    }

    @IBAction func homeBtn(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "GameSelectViewController") as? GameSelectViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    func inputRecord() {
        versusData = dbHelper.readRecordData(name: userName!, section: "reaction")
        if data < versusData{
            dbHelper.updateDate(name: "\(userName!)", value: data, section: "reaction")
            print("기록 갱신")
        }
        
    }
}
