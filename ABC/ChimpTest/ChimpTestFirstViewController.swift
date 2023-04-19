//
//  ChimpTestFirstViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/17.
//

import UIKit

protocol ContainerVCDelegateChimp: AnyObject {
    func didReceivedValueFromContainerBool(_ controller: ChimpTestFirstViewController, value: Bool)
    func didReceivedValueFromContainerLife(_ controller: ChimpTestFirstViewController, value: Int)
}

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
    
    weak var delegate: ContainerVCDelegateChimp?
    
    let WHITE = UIColor(named: "buttonTouch")
    let BLUE = UIColor(named: "background")
    let SELECT = UIColor(named: "buttonWrong")
    let BLUESTROKE = UIColor(named: "ChimpStroke")
    
    var checkrandom = Set<Int>()
    var rememberRandom = Set<Int>()
    var number: Int = 4 // 4개의 숫자부터 시작
    var count: Int = 1 // 순서 확인용 count
    var minicount: Int = 1 // 버튼 title전용 count
    var goNextLevel: Bool = false
    
    var btnbool : [Bool] = Array(repeating: false, count: 40)
    var btnbool2 : [Bool] = Array(repeating: false, count: 40)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[0] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn1Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn2(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[1] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn2Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn3(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[2] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn3Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn4(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[3] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn4Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn5(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[4] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn5Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn6(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[5] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn6Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn7(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[6] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn7Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn8(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[7] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn8Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn9(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[8] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn9Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn10(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[9] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn10Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn11(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[10] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn11Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn12(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[11] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn12Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn13(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[12] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn13Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn14(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[13] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn14Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn15(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[14] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn15Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn16(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[15] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn16Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn17(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[16] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn17Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn18(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[17] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn18Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn19(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[18] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn19Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn20(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[19] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn20Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn21(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[20] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn21Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn22(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[21] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn22Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn23(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[22] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn23Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn24(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[23] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn24Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn25(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[24] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn25Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn26(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[25] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn26Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn27(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[26] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn27Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn28(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[27] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn28Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn29(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[28] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn29Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn30(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[29] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn30Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn31(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[30] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn31Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn32(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[31] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn32Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn33(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[32] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn33Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn34(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[33] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn34Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn35(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[34] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn35Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn36(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[35] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn36Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn37(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[36] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn37Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn38(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[37] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn38Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn39(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[38] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn39Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    @IBAction func btn40(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if btnbool[39] == true { // true일때만 버튼 기능이 실행
            if String(count) == numberValue {
                btn40Label.layer.isHidden = true
                setWhite()  // 나머지 버튼들 흰색으로 변경
                goodEnding()
            } else {
                badEnding()
            }
        }
    }
    
    func settingPlayBtn(_ x: UIButton) {
        x.layer.borderColor = BLUESTROKE?.cgColor
        x.layer.borderWidth = 5
        x.layer.cornerRadius = 10
        x.setTitle(String(minicount), for: .normal)
        minicount += 1
    }
    
    
    func play() {
        if number < 40 {
            while checkrandom.count < number {
                let randomNum = Int.random(in: 1...40)
                checkrandom.insert(randomNum)
                print(checkrandom)
            }
            rememberRandom = checkrandom
            for i in checkrandom {
                switch i {
                case 1:
                    settingPlayBtn(btn1Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 2:
                    settingPlayBtn(btn2Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 3:
                    settingPlayBtn(btn3Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 4:
                    settingPlayBtn(btn4Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 5:
                    settingPlayBtn(btn5Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 6:
                    settingPlayBtn(btn6Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 7:
                    settingPlayBtn(btn7Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 8:
                    settingPlayBtn(btn8Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 9:
                    settingPlayBtn(btn9Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 10:
                    settingPlayBtn(btn10Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 11:
                    settingPlayBtn(btn11Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 12:
                    settingPlayBtn(btn12Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 13:
                    settingPlayBtn(btn13Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 14:
                    settingPlayBtn(btn14Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 15:
                    settingPlayBtn(btn15Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 16:
                    settingPlayBtn(btn16Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 17:
                    settingPlayBtn(btn17Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 18:
                    settingPlayBtn(btn18Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 19:
                    settingPlayBtn(btn19Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 20:
                    settingPlayBtn(btn20Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 21:
                    settingPlayBtn(btn21Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 22:
                    settingPlayBtn(btn22Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 23:
                    settingPlayBtn(btn23Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 24:
                    settingPlayBtn(btn24Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 25:
                    settingPlayBtn(btn25Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 26:
                    settingPlayBtn(btn26Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 27:
                    settingPlayBtn(btn27Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 28:
                    settingPlayBtn(btn28Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 29:
                    settingPlayBtn(btn29Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 30:
                    settingPlayBtn(btn30Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 31:
                    settingPlayBtn(btn31Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 32:
                    settingPlayBtn(btn32Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 33:
                    settingPlayBtn(btn33Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 34:
                    settingPlayBtn(btn34Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 35:
                    settingPlayBtn(btn35Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 36:
                    settingPlayBtn(btn36Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 37:
                    settingPlayBtn(btn37Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 38:
                    settingPlayBtn(btn38Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 39:
                    settingPlayBtn(btn39Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 40:
                    settingPlayBtn(btn40Label)
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                    
                default:
                    break
                }
            }
        }
    }

    
    func goodEnding() {
        count += 1
        // 4개 다 맞췄다면 화면 전환
        if count > number {
            goNextLevel = true
            print("다 맞춤")
            // 변수들 초기화
            btnbool = Array(repeating: false, count: 40)
            btnbool2 = Array(repeating: false, count: 40)
            count = 1
            minicount = 1
            goReset()
            
            delegate?.didReceivedValueFromContainerBool(self, value: goNextLevel)
        }
    }
    
    func badEnding() {
        // 목숨 체크 후 판단
        print("배드엔딩")
        // 변수 초기화
        btnbool = Array(repeating: false, count: 40)
        btnbool2 = Array(repeating: false, count: 40)
        checkrandom.removeAll()
        count = 1
        minicount = 1
        goReset()
        
        
        delegate?.didReceivedValueFromContainerLife(self, value: 1)
    }
    
    func numCheck(_ value: Int) {
        number += value
    }
    
    func setStart() {
        play()
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
    
    func goResetFunction(x: UIButton) {
        x.layer.isHidden = false
        x.backgroundColor = BLUE
        x.setTitle("", for: .normal)
        x.layer.borderWidth = 0
    }
    
    func goReset() {
        for i in rememberRandom {
            switch i {
            case 1:
                goResetFunction(x: btn1Label)
            case 2:
                goResetFunction(x: btn2Label)
            case 3:
                goResetFunction(x: btn3Label)
            case 4:
                goResetFunction(x: btn4Label)
            case 5:
                goResetFunction(x: btn5Label)
            case 6:
                goResetFunction(x: btn6Label)
            case 7:
                goResetFunction(x: btn7Label)
            case 8:
                goResetFunction(x: btn8Label)
            case 9:
                goResetFunction(x: btn9Label)
            case 10:
                goResetFunction(x: btn10Label)
            case 11:
                goResetFunction(x: btn11Label)
            case 12:
                goResetFunction(x: btn12Label)
            case 13:
                goResetFunction(x: btn13Label)
            case 14:
                goResetFunction(x: btn14Label)
            case 15:
                goResetFunction(x: btn15Label)
            case 16:
                goResetFunction(x: btn16Label)
            case 17:
                goResetFunction(x: btn17Label)
            case 18:
                goResetFunction(x: btn18Label)
            case 19:
                goResetFunction(x: btn19Label)
            case 20:
                goResetFunction(x: btn20Label)
            case 21:
                goResetFunction(x: btn21Label)
            case 22:
                goResetFunction(x: btn22Label)
            case 23:
                goResetFunction(x: btn23Label)
            case 24:
                goResetFunction(x: btn24Label)
            case 25:
                goResetFunction(x: btn25Label)
            case 26:
                goResetFunction(x: btn26Label)
            case 27:
                goResetFunction(x: btn27Label)
            case 28:
                goResetFunction(x: btn28Label)
            case 29:
                goResetFunction(x: btn29Label)
            case 30:
                goResetFunction(x: btn30Label)
            case 31:
                goResetFunction(x: btn31Label)
            case 32:
                goResetFunction(x: btn32Label)
            case 33:
                goResetFunction(x: btn33Label)
            case 34:
                goResetFunction(x: btn34Label)
            case 35:
                goResetFunction(x: btn35Label)
            case 36:
                goResetFunction(x: btn36Label)
            case 37:
                goResetFunction(x: btn37Label)
            case 38:
                goResetFunction(x: btn38Label)
            case 39:
                goResetFunction(x: btn39Label)
            case 40:
                goResetFunction(x: btn40Label)
                
            default:
                break
            }
        }
    }
    
}
