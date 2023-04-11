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
    var nextButton = UIButton()
    
    var randomup : Int = 0
    var randomleft : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btn1Label.layer.isHidden = true

        


        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        
//        self.view.addSubview(nextButton)
//        nextButton.translatesAutoresizingMaskIntoConstraints = false    //원하는 constraint잡기 위해 false
//        nextButton.widthAnchor.constraint(equalToConstant: 50).isActive = true //넓이
//        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true //높이
        
        //randomup = Int.random(in: 0...650)
        //randomleft = Int.random(in: 0...300)
        self.view.addSubview(nextButton)
        
        
        randomup += 10
        randomleft += 10
        print(randomup, randomleft)
        
        testbtnLabel.translatesAutoresizingMaskIntoConstraints = false
        testbtnLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        testbtnLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        testbtnLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: CGFloat(randomup)).isActive = true
        testbtnLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: CGFloat(randomleft)).isActive = true
          
        testbtnLabel.setTitle("다음", for: .normal)
        testbtnLabel.setTitleColor(.black, for: .normal)
        testbtnLabel.backgroundColor = .orange
        
    }
    @IBAction func nextButton(_ sender: UIButton) {
        
    }

}
