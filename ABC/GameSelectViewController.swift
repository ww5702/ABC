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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func gotoReaction(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ReactionGameViewController") as? ReactionGameViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func gotoVerbalMemory(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "VerbalMemoryExplainViewController") as? VerbalMemoryExplainViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func gotoVisualMemory(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "VisualMemoryExplainViewController") as? VisualMemoryExplainViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
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
