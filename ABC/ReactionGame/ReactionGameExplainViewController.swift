//
//  ReactionGameExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/05.
//

import Lottie
import UIKit

class ReactionGameExplainViewController: UIViewController {
    var userName: String?
    var isFirstTimeRecord: Bool?
    
    @IBOutlet weak var explainLabel: UILabel!
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        explainLabel.text = ""
        let explainText = "총 5번의 테스트가 진행됩니다.\n화면이 초록색으로 변한다면\n반응하여 터치하세요."
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        animationView = .init(name: "ReactionTestExplain")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play(fromFrame: 0, toFrame: 31)

        // Do any additional setup after loading the view.
    }
    

//    @IBAction func startbtn(_ sender: UIButton) {
//        guard let vc = storyboard?.instantiateViewController(identifier: "ReactionGameViewController") as? ReactionGameViewController else {return}
//        vc.userName = userName
//        self.navigationController?.pushViewController(vc, animated: true)
//    }

    @IBAction func backbtn(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ReactionGameViewController = segue.destination as? ReactionGameViewController else { return }
        
        ReactionGameViewController.userName = self.userName
        ReactionGameViewController.isFirstTimeRecord = self.isFirstTimeRecord
    }
}
