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
    
    @IBOutlet weak var lottieView: UIView!
    
    private var animationView: LottieAnimationView?
    
    let RED = UIColor(named: "turnRed")
    
    var data = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        4
        animationView = .init(name: "gold_trophy")
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()

        scoreLabel.text = "\(data) 점"
        
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
