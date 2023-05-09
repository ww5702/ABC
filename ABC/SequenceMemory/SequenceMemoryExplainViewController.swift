//
//  SequenceMemoryExplainViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/24.
//

import Lottie
import UIKit

class SequenceMemoryExplainViewController: UIViewController {
    var userName: String?
    var isFirstTimeRecord: Bool?
    
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        titleLabel.text = "Sequence Memory"
        explainLabel.text = ""
        let explainText = "순서를 기억하세요\n기회는 단 한번 입니다."
        
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        animationView = .init(name: "sequence_memory")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
        
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let SequenceMemoryViewController = segue.destination as? SequenceMemoryViewController else { return }
        
        SequenceMemoryViewController.userName = self.userName
        SequenceMemoryViewController.isFirstTimeRecord = self.isFirstTimeRecord
        
    }
    
}
