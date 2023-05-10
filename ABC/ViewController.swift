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
    var nameCheck: Int = 0
    let dbHelper = DBHelper.shared
    
    private var animationView: LottieAnimationView?
    @IBOutlet weak var nameTextField: UITextField!
    var keyHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(done))
        // done 버튼을 오른쪽으로 보내기 위한 더미 버튼
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        
        toolbar.setItems([flexBarButton, doneButton], animated: false)
        nameTextField.inputAccessoryView = toolbar
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        

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


        //dbHelper.createTable()
        //dbHelper.insertData(name: "2번", value: 20, section: "aim")
        //dbHelper.updateDate(id: 1, name: "수정 테스터", age: 10)
    }
    
    // 키보드 내리기
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func done() {
        self.view.endEditing(true)
    }

    @IBAction func btnPlayGame(_ sender: UIButton) {
        if nameTextField.text?.count == 0 {
            let tooEarly = UIAlertController(title: "정보", message: "당신의 이름을 적어주세요!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            tooEarly.addAction(okAction)
            present(tooEarly,animated: true)
        } else {
            if dbHelper.checkName(name: nameTextField.text!) != 0 {
                let tooEarly = UIAlertController(title: "정보", message: "이미 존재하는 이름입니다!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                tooEarly.addAction(okAction)
                present(tooEarly,animated: true)
            } else {
                guard let vc = storyboard?.instantiateViewController(identifier: "GameSelectViewController") as? GameSelectViewController else {return}
                vc.userName = nameTextField.text
                let navigationController = UINavigationController(rootViewController: vc)
                navigationController.modalPresentationStyle = .fullScreen
                navigationController.isNavigationBarHidden = false
                present(navigationController, animated: true)
            }
            
        }
        
    }
    @objc func keyboardWillShow(_ sender: Notification) {
            let userInfo:NSDictionary = sender.userInfo! as NSDictionary
            let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            keyHeight = keyboardHeight

            self.view.frame.size.height -= keyboardHeight
        }
    @objc func keyboardWillHide(_ sender: Notification) {
            
            self.view.frame.size.height += keyHeight!
        }
    
}

