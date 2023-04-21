//
//  AimTrainerExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/10.
//

import UIKit
import Lottie

class AimTrainerExplainViewController: UIViewController {

    @IBOutlet weak var explainLabel: UILabel!
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white

        explainLabel.text = ""
        let explainText = "최대한 빠르고 정확하게 타겟을 클릭하세요\n총 30개의 타겟을 클릭하면\n누적 시간이 출력됩니다."
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }
        changeTextColor()
        
        animationView = .init(name: "aimTarget")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play(fromFrame: 0, toFrame: 36)
        
    }
    

    func changeTextColor() {
        guard let text = self.explainLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 30)
        let attributeString = NSMutableAttributedString(string: text)
        
        
        attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "30"))
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "30"))
        self.explainLabel.attributedText = attributeString
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
