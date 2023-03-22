//
//  GameSelectViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/17.
//

import UIKit

class GameSelectViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    func goToViewController(where: String) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: `where`)
        self.navigationController?.pushViewController(pushVC!, animated: true)
        
    }
    
    

}
