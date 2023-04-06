//
//  NumberMemoryViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/04.
//

import UIKit

class NumberMemoryViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    var timeEnd: Bool = false
    private var numbercontainerVC: NumberMemoryFirstViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        firstView.alpha = 1
        secondView.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "firstContainer":
            numbercontainerVC = segue.destination as? NumberMemoryFirstViewController
            numbercontainerVC?.delegate = self
            
        default:
            break
        }
    }



}

extension NumberMemoryViewController: ContainerVCDelegatenumber {
    func didReceivedValueFromContainer(_ controller: NumberMemoryFirstViewController, value: Bool) {
        timeEnd = value
        if timeEnd == true {
            firstView.alpha = 0
            secondView.alpha = 1
        }
    }
}
