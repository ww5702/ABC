//
//  SequenceMemoryScoreViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/26.
//

import Lottie
import UIKit

class SequenceMemoryScoreViewController: UIViewController {
    
    var data = 0
    
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

        // Do any additional setup after loading the view.
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
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SequenceMemoryViewController") as? SequenceMemoryViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    @IBAction func gotoHome(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "GameSelectViewController") as? GameSelectViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}
