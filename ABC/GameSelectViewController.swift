//
//  GameSelectViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/17.
//

import UIKit

class GameSelectViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var reactionBtn: UIButton!
    @IBOutlet weak var verbalBtn: UIButton!
    @IBOutlet weak var visualBtn: UIButton!
    @IBOutlet weak var numberBtn: UIButton!
    @IBOutlet weak var aimBtn: UIButton!
    
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "⭐️Choose the Test⭐️\n『\(userName!)』"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func gotoReaction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ReactionGameExplainViewController") as? ReactionGameExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    @IBAction func gotoVerbalMemory(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "VerbalMemoryExplainViewController") as? VerbalMemoryExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    @IBAction func gotoVisualMemory(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "VisualMemoryExplainViewController") as? VisualMemoryExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    
    @IBAction func gotoNumberMemory(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "NumberMemoryExplainViewController") as? NumberMemoryExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    
    @IBAction func gotoAimTrainer(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "AimTrainerExplainViewController") as? AimTrainerExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    @IBAction func gotoChimpTest(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ChimpTestExplainViewController") as? ChimpTestExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    
    @IBAction func gotoSequenceMemory(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SequenceMemoryExplainViewController") as? SequenceMemoryExplainViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    
    @IBAction func gotoRank(_ sender: UIButton) {
//        guard let vc = storyboard?.instantiateViewController(identifier: "RankViewController") as? RankViewController else {return}
//        let navigationController = UINavigationController(rootViewController: vc)
//        navigationController.modalPresentationStyle = .fullScreen
//        navigationController.isNavigationBarHidden = false
//        present(navigationController, animated: true)
    }
    

}
