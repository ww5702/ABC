//
//  AimTrainerViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/10.
//

import UIKit

class AimTrainerViewController: UIViewController {
    
    
    @IBOutlet weak var btn1Label: UIButton!
    var nextButton = UIButton()
    
    var randomup : Int = 0
    var randomleft : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btn1Label.layer.isHidden = true
        self.view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false    //원하는 constraint잡기 위해 false
        
        nextButton.widthAnchor.constraint(equalToConstant: 50).isActive = true //넓이
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true //높이
        
        // 위치잡기
        nextButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        nextButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true
          
        nextButton.setTitle("1", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = .orange
        


        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func btn1(_ sender: UIButton) {
        randomup = Int.random(in: 0...650)
        randomleft = Int.random(in: 0...300)
        print(randomup, randomleft)
        
        self.view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false    //원하는 constraint잡기 위해 false
        
        nextButton.widthAnchor.constraint(equalToConstant: 50).isActive = true //넓이
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true //높이
        
        // 위치잡기
        nextButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: CGFloat(randomup)).isActive = true
        nextButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: CGFloat(randomleft)).isActive = true
          
        nextButton.setTitle("2", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.backgroundColor = .orange
        
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
