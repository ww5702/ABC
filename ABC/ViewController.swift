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
    @IBOutlet weak var passTextField: UITextField!
    
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

        animationView = .init(name: "main")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()


        //dbHelper.createTable()
        //dbHelper.insertData(name: "2번", value: 20, section: "aim")
        //dbHelper.updateDate(id: 1, name: "수정 테스터", age: 10)
        //dbHelper.deleteTable(tableName: "ABC_user")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }
    
    @objc func done() {
        self.view.endEditing(true)
    }

    @IBAction func btnPlayGame(_ sender: UIButton) {
        if nameTextField.text?.count == 0 || passTextField.text?.count == 0 {
            noticeMessage(x: "ID/PASS를 적어주세요!")
        } else {
            if dbHelper.checkName(name: nameTextField.text!) == "" {
                dbHelper.signUp(name: nameTextField.text!, password: passTextField.text!)
                guard let vc = storyboard?.instantiateViewController(identifier: "GameSelectViewController") as? GameSelectViewController else {return}
                vc.userName = nameTextField.text
                vc.welcomeMessage = 1
                let navigationController = UINavigationController(rootViewController: vc)
                navigationController.modalPresentationStyle = .fullScreen
                navigationController.isNavigationBarHidden = false
                present(navigationController, animated: true)
                
            } else if dbHelper.checkName(name: nameTextField.text!) != passTextField.text! {
                noticeMessage(x: "비밀번호가 다릅니다!")
            } else if dbHelper.checkName(name: nameTextField.text!) == passTextField.text!{
                guard let vc = storyboard?.instantiateViewController(identifier: "GameSelectViewController") as? GameSelectViewController else {return}
                vc.userName = nameTextField.text
                vc.welcomeMessage = 2
                let navigationController = UINavigationController(rootViewController: vc)
                navigationController.modalPresentationStyle = .fullScreen
                navigationController.isNavigationBarHidden = false
                present(navigationController, animated: true)
            }
            
        }
    }
    
    // 키보드가 나타났다는 알림을 받으면 실행할 메서드
    @objc func keyboardWillShow(_ noti: NSNotification){
        // 키보드의 높이만큼 화면을 올려준다.
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.frame.origin.y -= keyboardHeight
        }
    }

    // 키보드가 사라졌다는 알림을 받으면 실행할 메서드
    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드의 높이만큼 화면을 내려준다.
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.frame.origin.y += keyboardHeight
        }
    }
    
    // 노티피케이션을 추가하는 메서드
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func noticeMessage(x : String) {
        let tooEarly = UIAlertController(title: "정보", message: "\(x)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        tooEarly.addAction(okAction)
        present(tooEarly,animated: true)
    }
    /*
     func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
             let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
             toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
             toastLabel.textColor = UIColor.white
             toastLabel.font = font
             toastLabel.textAlignment = .center;
             toastLabel.text = message
             toastLabel.alpha = 1.0
             toastLabel.layer.cornerRadius = 10;
             toastLabel.clipsToBounds  =  true
             self.view.addSubview(toastLabel)
             UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: {
                  toastLabel.alpha = 0.0
             }, completion: {(isCompleted) in
                 toastLabel.removeFromSuperview()
             })
         }
     */
}

