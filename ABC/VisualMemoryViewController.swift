//
//  VisualMemoryViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/24.
//

import UIKit

class VisualMemoryViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstView.alpha = 1
        secondView.alpha = 0
    }

    @IBAction func asdf(_ sender: Any) {
        firstView.alpha = 0
        secondView.alpha = 1
    }
    
    /*
     
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
