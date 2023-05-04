//
//  ChimpTestExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/14.
//

import UIKit
import Lottie

class ChimpTestExplainViewController: UIViewController {
    var userName: String?
    
    @IBOutlet weak var explainLabel: UILabel!
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        

        explainLabel.text = ""
        let explainText = "숫자에 따라 순서대로 사각형을 클릭하세요.\n테스트는 점점 더 어려워질거에요."
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        animationView = .init(name: "ChimpTestExplain")
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
        guard let ChimpTestViewController = segue.destination as? ChimpTestViewController else { return }
        
        ChimpTestViewController.userName = self.userName
    }
    

}
