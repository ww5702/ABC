//
//  ChimpTestFirstViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/17.
//

import UIKit

class ChimpTestFirstViewController: UIViewController {
    @IBOutlet weak var btn1Label: UIButton!
    @IBOutlet weak var btn2Label: UIButton!
    @IBOutlet weak var btn3Label: UIButton!
    @IBOutlet weak var btn4Label: UIButton!
    @IBOutlet weak var btn5Label: UIButton!
    @IBOutlet weak var btn6Label: UIButton!
    @IBOutlet weak var btn7Label: UIButton!
    @IBOutlet weak var btn8Label: UIButton!
    @IBOutlet weak var btn9Label: UIButton!
    @IBOutlet weak var btn10Label: UIButton!
    @IBOutlet weak var btn11Label: UIButton!
    @IBOutlet weak var btn12Label: UIButton!
    @IBOutlet weak var btn13Label: UIButton!
    @IBOutlet weak var btn14Label: UIButton!
    @IBOutlet weak var btn15Label: UIButton!
    @IBOutlet weak var btn16Label: UIButton!
    @IBOutlet weak var btn17Label: UIButton!
    @IBOutlet weak var btn18Label: UIButton!
    @IBOutlet weak var btn19Label: UIButton!
    @IBOutlet weak var btn20Label: UIButton!
    @IBOutlet weak var btn21Label: UIButton!
    @IBOutlet weak var btn22Label: UIButton!
    @IBOutlet weak var btn23Label: UIButton!
    @IBOutlet weak var btn24Label: UIButton!
    @IBOutlet weak var btn25Label: UIButton!
    @IBOutlet weak var btn26Label: UIButton!
    @IBOutlet weak var btn27Label: UIButton!
    @IBOutlet weak var btn28Label: UIButton!
    @IBOutlet weak var btn29Label: UIButton!
    @IBOutlet weak var btn30Label: UIButton!
    @IBOutlet weak var btn31Label: UIButton!
    @IBOutlet weak var btn32Label: UIButton!
    @IBOutlet weak var btn33Label: UIButton!
    @IBOutlet weak var btn34Label: UIButton!
    @IBOutlet weak var btn35Label: UIButton!
    @IBOutlet weak var btn36Label: UIButton!
    @IBOutlet weak var btn37Label: UIButton!
    @IBOutlet weak var btn38Label: UIButton!
    @IBOutlet weak var btn39Label: UIButton!
    @IBOutlet weak var btn40Label: UIButton!
    
    let WHITE = UIColor(named: "buttonTouch")
    let BLUE = UIColor(named: "buttonReady")
    let SELECT = UIColor(named: "buttonWrong")
    let BLUESTROKE = UIColor(named: "ChimpStroke")
    
    var checkrandom = Set<Int>()
    var number: Int = 4 // 4개의 숫자부터 시작
    var count: Int = 1 // 순서 확인용 count
    
    var btnbool : [Bool] = Array(repeating: false, count: 40)
    var btnbool2 : [Bool] = Array(repeating: false, count: 40)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[0] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn2(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[1] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn3(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[2] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn4(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[3] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn5(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[4] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn6(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[5] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn7(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[6] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn8(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[7] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn9(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[8] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn10(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[9] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn11(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[10] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn12(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[11] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn13(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[12] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn14(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[13] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn15(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[14] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn16(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[15] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn17(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[16] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn18(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[17] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn19(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[18] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn20(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[19] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn21(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[20] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn22(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[21] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn23(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[22] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn24(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[23] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn25(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[24] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn26(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[25] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn27(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[26] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn28(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[27] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn29(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[28] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn30(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[29] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn31(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[30] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn32(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[31] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn33(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[32] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn34(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[33] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn35(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[34] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn36(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[35] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn37(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[36] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn38(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[37] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn39(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[38] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn40(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        print(numberValue)
        if btnbool[39] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                setWhite()  // 나머지 버튼들 흰색으로 변경
                count += 1
            } else {
                badEnding()
            }
        }
    }
    
    
    func play() {
        print("시작")
        if number < 40 {
            var minicount = 1
            while checkrandom.count < number {
                let randomNum = Int.random(in: 1...40)
                checkrandom.insert(randomNum)
                print(checkrandom)
            }
            
            for i in checkrandom {
                switch i {
                case 1:
                    btn1Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn1Label.layer.borderWidth = 5
                    btn1Label.layer.cornerRadius = 10
                    btn1Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 2:
                    btn2Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn2Label.layer.borderWidth = 5
                    btn2Label.layer.cornerRadius = 10
                    btn2Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 3:
                    btn3Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn3Label.layer.borderWidth = 5
                    btn3Label.layer.cornerRadius = 10
                    btn3Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 4:
                    btn4Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn4Label.layer.borderWidth = 5
                    btn4Label.layer.cornerRadius = 10
                    btn4Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 5:
                    btn5Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn5Label.layer.borderWidth = 5
                    btn5Label.layer.cornerRadius = 10
                    btn5Label.setTitle(String(minicount), for: .normal)
                    btn5Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 6:
                    btn6Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn6Label.layer.borderWidth = 5
                    btn6Label.layer.cornerRadius = 10
                    btn6Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 7:
                    btn7Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn7Label.layer.borderWidth = 5
                    btn7Label.layer.cornerRadius = 10
                    btn7Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 8:
                    btn8Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn8Label.layer.borderWidth = 5
                    btn8Label.layer.cornerRadius = 10
                    btn8Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 9:
                    btn9Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn9Label.layer.borderWidth = 5
                    btn9Label.layer.cornerRadius = 10
                    btn9Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 10:
                    btn10Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn10Label.layer.borderWidth = 5
                    btn10Label.layer.cornerRadius = 10
                    btn10Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 11:
                    btn11Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn11Label.layer.borderWidth = 5
                    btn11Label.layer.cornerRadius = 10
                    btn11Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 12:
                    btn12Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn12Label.layer.borderWidth = 5
                    btn12Label.layer.cornerRadius = 10
                    btn12Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 13:
                    btn13Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn13Label.layer.borderWidth = 5
                    btn13Label.layer.cornerRadius = 10
                    btn13Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 14:
                    btn14Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn14Label.layer.borderWidth = 5
                    btn14Label.layer.cornerRadius = 10
                    btn14Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 15:
                    btn15Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn15Label.layer.borderWidth = 5
                    btn15Label.layer.cornerRadius = 10
                    btn15Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 16:
                    btn16Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn16Label.layer.borderWidth = 5
                    btn16Label.layer.cornerRadius = 10
                    btn16Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 17:
                    btn17Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn17Label.layer.borderWidth = 5
                    btn17Label.layer.cornerRadius = 10
                    btn17Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 18:
                    btn18Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn18Label.layer.borderWidth = 5
                    btn18Label.layer.cornerRadius = 10
                    btn18Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 19:
                    btn19Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn19Label.layer.borderWidth = 5
                    btn19Label.layer.cornerRadius = 10
                    btn19Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 20:
                    btn20Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn20Label.layer.borderWidth = 5
                    btn20Label.layer.cornerRadius = 10
                    btn20Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 21:
                    btn21Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn21Label.layer.borderWidth = 5
                    btn21Label.layer.cornerRadius = 10
                    btn21Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 22:
                    btn22Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn22Label.layer.borderWidth = 5
                    btn22Label.layer.cornerRadius = 10
                    btn22Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 23:
                    btn23Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn23Label.layer.borderWidth = 5
                    btn23Label.layer.cornerRadius = 10
                    btn23Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 24:
                    btn24Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn24Label.layer.borderWidth = 5
                    btn24Label.layer.cornerRadius = 10
                    btn24Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 25:
                    btn25Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn25Label.layer.borderWidth = 5
                    btn25Label.layer.cornerRadius = 10
                    btn25Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 26:
                    btn26Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn26Label.layer.borderWidth = 5
                    btn26Label.layer.cornerRadius = 10
                    btn26Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 27:
                    btn27Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn27Label.layer.borderWidth = 5
                    btn27Label.layer.cornerRadius = 10
                    btn27Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 28:
                    btn28Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn28Label.layer.borderWidth = 5
                    btn28Label.layer.cornerRadius = 10
                    btn28Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 29:
                    btn29Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn29Label.layer.borderWidth = 5
                    btn29Label.layer.cornerRadius = 10
                    btn29Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 30:
                    btn30Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn30Label.layer.borderWidth = 5
                    btn30Label.layer.cornerRadius = 10
                    btn30Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 31:
                    btn31Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn31Label.layer.borderWidth = 5
                    btn31Label.layer.cornerRadius = 10
                    btn31Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 32:
                    btn32Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn32Label.layer.borderWidth = 5
                    btn32Label.layer.cornerRadius = 10
                    btn32Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 33:
                    btn33Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn33Label.layer.borderWidth = 5
                    btn33Label.layer.cornerRadius = 10
                    btn33Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 34:
                    btn34Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn34Label.layer.borderWidth = 5
                    btn34Label.layer.cornerRadius = 10
                    btn34Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 35:
                    btn35Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn35Label.layer.borderWidth = 5
                    btn35Label.layer.cornerRadius = 10
                    btn35Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 36:
                    btn36Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn36Label.layer.borderWidth = 5
                    btn36Label.layer.cornerRadius = 10
                    btn36Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 37:
                    btn37Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn37Label.layer.borderWidth = 5
                    btn37Label.layer.cornerRadius = 10
                    btn37Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 38:
                    btn38Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn38Label.layer.borderWidth = 5
                    btn38Label.layer.cornerRadius = 10
                    btn38Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 39:
                    btn39Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn39Label.layer.borderWidth = 5
                    btn39Label.layer.cornerRadius = 10
                    btn39Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 40:
                    btn40Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn40Label.layer.borderWidth = 5
                    btn40Label.layer.cornerRadius = 10
                    btn40Label.setTitle(String(minicount), for: .normal)
                    minicount += 1
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                    
                default:
                    break
                }
            }
        }
    }
    func setWhite() {
        checkrandom.removeFirst()
        for i in checkrandom {
            switch i {
            case 1:
                btn1Label.backgroundColor = WHITE
            case 2:
                btn2Label.backgroundColor = WHITE
            case 3:
                btn3Label.backgroundColor = WHITE
            case 4:
                btn4Label.backgroundColor = WHITE
            case 5:
                btn5Label.backgroundColor = WHITE
            case 6:
                btn6Label.backgroundColor = WHITE
            case 7:
                btn7Label.backgroundColor = WHITE
            case 8:
                btn8Label.backgroundColor = WHITE
            case 9:
                btn9Label.backgroundColor = WHITE
            case 10:
                btn10Label.backgroundColor = WHITE
            case 11:
                btn11Label.backgroundColor = WHITE
            case 12:
                btn12Label.backgroundColor = WHITE
            case 13:
                btn13Label.backgroundColor = WHITE
            case 14:
                btn14Label.backgroundColor = WHITE
            case 15:
                btn15Label.backgroundColor = WHITE
            case 16:
                btn16Label.backgroundColor = WHITE
            case 17:
                btn17Label.backgroundColor = WHITE
            case 18:
                btn18Label.backgroundColor = WHITE
            case 19:
                btn19Label.backgroundColor = WHITE
            case 20:
                btn20Label.backgroundColor = WHITE
            case 21:
                btn21Label.backgroundColor = WHITE
            case 22:
                btn22Label.backgroundColor = WHITE
            case 23:
                btn23Label.backgroundColor = WHITE
            case 24:
                btn24Label.backgroundColor = WHITE
            case 25:
                btn25Label.backgroundColor = WHITE
            case 26:
                btn26Label.backgroundColor = WHITE
            case 27:
                btn27Label.backgroundColor = WHITE
            case 28:
                btn28Label.backgroundColor = WHITE
            case 29:
                btn29Label.backgroundColor = WHITE
            case 30:
                btn30Label.backgroundColor = WHITE
            case 31:
                btn31Label.backgroundColor = WHITE
            case 32:
                btn32Label.backgroundColor = WHITE
            case 33:
                btn33Label.backgroundColor = WHITE
            case 34:
                btn34Label.backgroundColor = WHITE
            case 35:
                btn35Label.backgroundColor = WHITE
            case 36:
                btn36Label.backgroundColor = WHITE
            case 37:
                btn37Label.backgroundColor = WHITE
            case 38:
                btn38Label.backgroundColor = WHITE
            case 39:
                btn39Label.backgroundColor = WHITE
            case 40:
                btn40Label.backgroundColor = WHITE
                
            default:
                break
            }
        }
    }
    
    func badEnding() {
        // 목숨 체크 후 판단
        print("배드엔딩")
    }
    func gotoResult() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ChimpTestScoreViewController") as? ChimpTestScoreViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    func setStart() {
        play()
    }
    
}
