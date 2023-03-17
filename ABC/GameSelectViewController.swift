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
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "ReactionGameViewController")
        else {
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    
    func goToViewController(where: String) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: `where`)
        self.navigationController?.pushViewController(pushVC!, animated: true)
        
    }
    
    

}
