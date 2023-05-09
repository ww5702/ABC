//
//  NumberMemoryWrongViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/07.
//

import UIKit

class NumberMemoryWrongViewController: UIViewController {
    let dbHelper = DBHelper.shared
    var userName: String?
    var isFirstTimeRecord: Bool?
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var myAnswerLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    var answer: Int = 0
    var myAnswer: Int = 0
    var level: Int = 0
    var versusData: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func retryBtn(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "NumberMemoryViewController") as? NumberMemoryViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        vc.isFirstTimeRecord = isFirstTimeRecord!
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    @IBAction func gotoHome(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(identifier: "GameSelectViewController") as? GameSelectViewController else {return}
        let navigationController = UINavigationController(rootViewController: vc)
        vc.userName = userName
        vc.isFirstTimeRecord = isFirstTimeRecord!
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = false
        present(navigationController, animated: true)
    }
    
    
    func setAnswer(_ value: Int) {
        answer = value
    }
    func setMyAnswer(_ value: Int) {
        myAnswer = value
    }
    func setLevel(_ value: Int) {
        level = value
    }
    func setUserName(_ value: String, _ value2: Bool) {
        userName = value
        isFirstTimeRecord = value2
    }
    func play() {
        answerLabel.text = String(answer)
        myAnswerLabel.text = String(myAnswer)
        levelLabel.text = "\(level) LEVEL FAIL"
        inputRecord()
    }
    
    func inputRecord() {
        versusData = dbHelper.readRecordData(name: userName!, section: "number")
        if versusData == 0 {
            if isFirstTimeRecord == true {
                dbHelper.insertData(name: "\(userName!)", value: level-1, section: "number")
                print("첫 db 기록!")
                isFirstTimeRecord = false
            } else {
                dbHelper.updateDate(name: "\(userName!)", value: level-1, section: "number")
            }
            print("새 기록 추가")
        } else if level-1 > versusData{
            dbHelper.updateDate(name: "\(userName!)", value: level-1, section: "number")
            print("기록 갱신")
        } else {
            print("기록 갱신 실패!")
        }
    }
    
}
