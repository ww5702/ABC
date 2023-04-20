//
//  ChimpTestScoreViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/14.
//

import UIKit
import Lottie

class ChimpTestScoreViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    private var animationView: LottieAnimationView?
    
    let RED = UIColor(named: "turnRed")
    
    var data = 16

    override func viewDidLoad() {
        super.viewDidLoad()
//        lottieView.contentMode = .scaleAspectFit
//        lottieView.loopMode = .loop
//        lottieView.animationSpeed = 0.5
//        lottieView.play()
        
        if data < 5 {
            animationView = .init(name: "bronze_trophy2")
            animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 250)
            animationView!.contentMode = .scaleAspectFit
            animationView!.loopMode = .loop
            animationView!.animationSpeed = 0.5
            view.addSubview(animationView!)
            animationView!.play()
            
            scoreLabel.text = "\(data) 점"
            explainLabel.text = "안타까워요..\n90%의 침팬지는 9자리를 기억할 수 있습니다.\n다시 도전해보세요"
        } else if data <= 9 {
            animationView = .init(name: "test2")
            animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 250)
            animationView!.contentMode = .scaleAspectFit
            animationView!.loopMode = .loop
            animationView!.animationSpeed = 0.5
            view.addSubview(animationView!)
            animationView!.play()
            
            scoreLabel.text = "\(data) 점"
            explainLabel.text = "흐으음...\n90%의 침팬지는 9자리를 기억할 수 있습니다.\n침팬지 정도는 되시는군요!"
        } else if data <= 13 {
            animationView = .init(name: "gold_trophy")
            animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 250)
            animationView!.contentMode = .scaleAspectFit
            animationView!.loopMode = .loop
            animationView!.animationSpeed = 0.5
            view.addSubview(animationView!)
            animationView!.play()
            
            scoreLabel.text = "\(data) 점"
            explainLabel.text = "GREAT!\n최고는 아니지만 이정도면 어디가서 꿀리진 않겠어요!"
        } else {
            animationView = .init(name: "gold_trophy2")
            animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 250)
            animationView!.contentMode = .scaleAspectFit
            animationView!.loopMode = .loop
            animationView!.animationSpeed = 0.5
            view.addSubview(animationView!)
            animationView!.play()
            
            scoreLabel.text = "\(data) 점"
            explainLabel.text = "!!CHAMPION!!\n이보다 좋은 결과는 없을거에요"
        }
        
        
        changeTextColor()
    }
    func changeTextColor() {
        guard let text = self.scoreLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 70, weight: .semibold)
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "\(data)"))
        self.scoreLabel.attributedText = attributeString
    }
    
    @IBAction func retryBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ChimpTestViewController") as? ChimpTestViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func gohomeBtn(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "GameSelectViewController") as? GameSelectViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    

}
