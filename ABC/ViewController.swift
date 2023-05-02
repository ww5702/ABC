//
//  ViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/14.
//

import SQLite3
import Lottie
import UIKit

class ViewController: UIViewController {
    
    private var animationView: LottieAnimationView?
    @IBOutlet weak var nameTextField: UITextField!
    
    var db:OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.isHidden = true
        // Do any additional setup after loading the view.
        
        animationView = .init(name: "main")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
        

        //createTable()
        //insertData(name: "두번째", age: 20)
        updateDate(id: 1, name: "수정첫번쨰", age: 11)
    }

    @IBAction func btnPlayGame(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "GameSelectViewController")
        // 전체 화면
        vcName?.modalPresentationStyle = .fullScreen
        // 전환 애니메이션
        vcName?.modalTransitionStyle = .crossDissolve
        self.present(vcName!, animated: true, completion: nil)
    }
    
}

