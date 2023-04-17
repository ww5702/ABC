//
//  ChimpTestViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/14.
//

import UIKit

class ChimpTestViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    private var chimpcontainerVC: ChimpTestFirstViewController?
    
    @IBOutlet weak var startLabel: UIButton!
    
    
    @IBOutlet weak var explainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        explainLabel.text = "PRESS\nSTART\nBUTTON"

        firstView.alpha = 0
        secondView.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "firstContainer":
            chimpcontainerVC = segue.destination as? ChimpTestFirstViewController
        default:
            break
        }
    }
    
    @IBAction func startBtn(_ sender: UIButton) {
        // 버튼 숨기고, 게임시작
        startLabel.layer.isHidden = true
        explainLabel.layer.isHidden = true
        chimpcontainerVC?.setStart()
        firstView.alpha = 1
        secondView.alpha = 0
    }
    
}
