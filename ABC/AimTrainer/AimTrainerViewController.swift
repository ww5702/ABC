//
//  AimTrainerViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/10.
//

import UIKit

class AimTrainerViewController: UIViewController {
    
    
    @IBOutlet weak var btn1Label: UIButton!
    @IBOutlet weak var testbtnLabel: UIButton!
    
    var leftConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    var topConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    
    var randomup : Int = 100
    var randomleft : Int = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btn1Label.layer.isHidden = true
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        //randomup = Int.random(in: 0...650)
        //randomleft = Int.random(in: 0...300)
        let safeArea = view.safeAreaLayoutGuide
        
        randomup += 10
        randomleft += 10
        print(randomup, randomleft)
        
        testbtnLabel.backgroundColor = UIColor.orange
        testbtnLabel.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = testbtnLabel.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: CGFloat(randomup))
        topConstraint?.isActive = true
        
        leftConstraint = testbtnLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor,constant: CGFloat(randomleft))
        leftConstraint?.isActive = true
        
//        trailingConstraint = testbtnLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        trailingConstraint?.isActive = true
        

//        bottomConstraint = testbtnLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        bottomConstraint?.isActive = true
        
    }
    
    
    @IBAction func testBtn(_ sender: UIButton) {
        
        let safeArea = view.safeAreaLayoutGuide
        
        randomup = Int.random(in: 0...700)
        randomleft = Int.random(in: 0...350)
        print(randomup,randomleft)
        
        leftConstraint?.isActive = false
        topConstraint?.isActive = false
        //<- 재정의 하기 위해서 isActive를 false로 바꿔주고 다시 32번 줄과 같이 true로 한다.
        leftConstraint = testbtnLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor,constant: CGFloat(randomleft))
        topConstraint = testbtnLabel.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: CGFloat(randomup))
        
        leftConstraint?.isActive = true
        topConstraint?.isActive = true
        print("눌렀다.")
    }
    
}
