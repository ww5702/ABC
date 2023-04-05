//
//  GameSelectViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/17.
//

import UIKit

class GameSelectViewController: UIViewController {
    
    
    @IBOutlet weak var reactionBtn: UIButton!
    @IBOutlet weak var verbalBtn: UIButton!
    @IBOutlet weak var visualBtn: UIButton!
    @IBOutlet weak var numberBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        reactionBtn.layer.borderWidth = 5
//        reactionBtn.layer.cornerRadius = 10
//        reactionBtn.layer.borderColor = UIColor.systemYellow.cgColor
//        
//        verbalBtn.layer.borderWidth = 5
//        verbalBtn.layer.borderColor = UIColor.systemYellow.cgColor
//        
//        visualBtn.layer.borderWidth = 5
//        visualBtn.layer.borderColor = UIColor.systemYellow.cgColor
//        
//        numberBtn.layer.borderWidth = 5
//        numberBtn.layer.borderColor = UIColor.systemYellow.cgColor
    }
    
    @IBAction func gotoReaction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ReactionGameExplainViewController") as? ReactionGameExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    @IBAction func gotoVerbalMemory(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "VerbalMemoryExplainViewController") as? VerbalMemoryExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    @IBAction func gotoVisualMemory(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "VisualMemoryExplainViewController") as? VisualMemoryExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    
    @IBAction func gotoNumberMemory(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "NumberMemoryExplainViewController") as? NumberMemoryExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    func goToViewController(where: String) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: `where`)
        self.navigationController?.pushViewController(pushVC!, animated: true)
        
    }
    
    

}
