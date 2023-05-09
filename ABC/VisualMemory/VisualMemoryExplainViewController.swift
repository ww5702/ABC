//
//  VisualMemoryExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/24.
//

import Lottie
import UIKit

class VisualMemoryExplainViewController: UIViewController {
    var userName: String?
    var isFirstTimeRecord: Bool?
    
    @IBOutlet weak var explainLabel: UILabel!
    private var animationView: LottieAnimationView?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        super.viewDidLoad()
        explainLabel.text = ""
        let explainText = "매 레벨마다 여러 타일이 흰색으로 깜빡입니다.\n그것들을 기억하고, 타일이 리셋된 후에\n다시 선택하세요!\n\n레벨은 점점 더 어려워집니다\n레벨당 타일 3개를 놓치면\n하나의 목숨을 잃습니다.\n\n최대한 멀리 갈수있도록 도전해보세요!"
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }

        animationView = .init(name: "VisualMemoryExplain")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func backbtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let VisualMemoryViewController = segue.destination as? VisualMemoryViewController else { return }
        
        VisualMemoryViewController.userName = self.userName
        VisualMemoryViewController.isFirstTimeRecord = self.isFirstTimeRecord
    }
    
}
