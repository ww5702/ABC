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
    
    let dbHelper = DBHelper.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(done))
        // done 버튼을 오른쪽으로 보내기 위한 더미 버튼
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexBarButton, doneButton], animated: false)
        
        nameTextField.inputAccessoryView = toolbar

        // Do any additional setup after loading the view.
        
        animationView = .init(name: "main")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
        
        // 키보드 내리기
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)


        //createTable()
        //insertData(name: "세번째", age: 30)
        dbHelper.updateDate(id: 1, name: "수정첫번째", age: 11)
    }
    
    // 키보드 내리기
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func done() {
        self.view.endEditing(true)
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

