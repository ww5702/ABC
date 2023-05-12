//
//  NumberMemoryExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/04.
//

import Lottie
import UIKit

class NumberMemoryExplainViewController: UIViewController {
    var userName: String?
    
    @IBOutlet weak var explainLabel: UILabel!
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        explainLabel.text = ""
        let explainText = "보통 사람은 한번에 7개의 숫자를 기억할 수 있다고 합니다.\n당신은 얼마나 더 외울 수 있나요?"
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        animationView = .init(name: "NumberMemoryExplain")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
        
    }

    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let NumberMemoryViewController = segue.destination as? NumberMemoryViewController else { return }
        NumberMemoryViewController.userName = self.userName
    }
    
}
