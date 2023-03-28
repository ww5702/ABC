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
    private var containerVC: VisualMemoryFirstViewController?
    
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let WHITE = UIColor.white
    let BLUE = UIColor.blue
    
    var score = 0
    var life = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lifeLabel.text = "Life | \(life)"
        scoreLabel.text = "Score | \(score)"
        
        firstView.alpha = 1
        secondView.alpha = 0

    }

    @IBAction func gameStart(_ sender: Any) {
        firstView.alpha = 1
        secondView.alpha = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "firstContainer":
            containerVC = segue.destination as? VisualMemoryFirstViewController
            containerVC?.delegate = self
            
        default:
            break
        }
    }
    

}

extension VisualMemoryViewController: ContainerVCDelegate {
    func didReceivedValueFromContainer(_ controller: VisualMemoryFirstViewController, value: String) {
        scoreLabel.text = "Score | \(value)"
    }
}
