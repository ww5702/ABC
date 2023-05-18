//
//  VerbalMemoryViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/20.
//

import Lottie
import UIKit

class VerbalMemoryExplainViewController: UIViewController {
    var userName: String?
    
    @IBOutlet weak var explainImage: UIImageView!
    @IBOutlet weak var explainLabel: UILabel!
    private var animationView: LottieAnimationView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        explainLabel.text = ""
        let explainText = "한번에 하나씩 단어가 표시됩니다.\n본적이 있는 단어라면 SEEN\n새로운 단어라면 NEW를 클릭하세요"
        var charIndex = 0.0
        for letter in explainText {
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) {
                Timer in self.explainLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        self.changeTextColor()
        animationView = .init(name: "VerbalMemoryExplain")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play(fromFrame: 0, toFrame: 90)

        // Do any additional setup after loading the view.
    }
    func changeTextColor() {
        guard let text = self.explainLabel.text else {return}
        let font = UIFont.systemFont(ofSize: 30)
        let attributeString = NSMutableAttributedString(string: text)
        
        
        attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "SEEN"))
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "SEEN"))
        attributeString.addAttribute(.foregroundColor, value: UIColor.blue, range: (text as NSString).range(of: "NEW"))
        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "NEW"))
        self.explainLabel.attributedText = attributeString
    }
    
    @IBAction func backbtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let VerbalMemoryViewController = segue.destination as? VerbalMemoryViewController else { return }
        VerbalMemoryViewController.userName = self.userName
    }
    
    
}
