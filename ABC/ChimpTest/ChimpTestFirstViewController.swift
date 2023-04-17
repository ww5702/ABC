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
    
    var number: Int = 4 // 4개의 숫자부터 시작
    
    var btnbool : [Bool] = Array(repeating: false, count: 40)
    var btnbool2 : [Bool] = Array(repeating: false, count: 40)

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func play() {
        print("시작")
        if number < 40 {
            var checkrandom = Set<Int>()
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
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 2:
                    btn2Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn2Label.layer.borderWidth = 5
                    btn2Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 3:
                    btn3Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn3Label.layer.borderWidth = 5
                    btn3Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 4:
                    btn4Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn4Label.layer.borderWidth = 5
                    btn4Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 5:
                    btn5Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn5Label.layer.borderWidth = 5
                    btn5Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 6:
                    btn6Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn6Label.layer.borderWidth = 5
                    btn6Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 7:
                    btn7Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn7Label.layer.borderWidth = 5
                    btn7Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 8:
                    btn8Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn8Label.layer.borderWidth = 5
                    btn8Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 9:
                    btn9Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn9Label.layer.borderWidth = 5
                    btn9Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 10:
                    btn10Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn10Label.layer.borderWidth = 5
                    btn10Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 11:
                    btn11Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn11Label.layer.borderWidth = 5
                    btn11Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 12:
                    btn12Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn12Label.layer.borderWidth = 5
                    btn12Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 13:
                    btn13Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn13Label.layer.borderWidth = 5
                    btn13Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 14:
                    btn14Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn14Label.layer.borderWidth = 5
                    btn14Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 15:
                    btn15Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn15Label.layer.borderWidth = 5
                    btn15Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 16:
                    btn16Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn16Label.layer.borderWidth = 5
                    btn16Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 17:
                    btn17Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn17Label.layer.borderWidth = 5
                    btn17Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 18:
                    btn18Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn18Label.layer.borderWidth = 5
                    btn18Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 19:
                    btn19Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn19Label.layer.borderWidth = 5
                    btn19Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 20:
                    btn20Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn20Label.layer.borderWidth = 5
                    btn20Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 21:
                    btn21Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn21Label.layer.borderWidth = 5
                    btn21Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 22:
                    btn22Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn22Label.layer.borderWidth = 5
                    btn22Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 23:
                    btn23Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn23Label.layer.borderWidth = 5
                    btn23Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 24:
                    btn24Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn24Label.layer.borderWidth = 5
                    btn24Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 25:
                    btn25Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn25Label.layer.borderWidth = 5
                    btn25Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 26:
                    btn26Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn26Label.layer.borderWidth = 5
                    btn26Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 27:
                    btn27Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn27Label.layer.borderWidth = 5
                    btn27Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 28:
                    btn28Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn28Label.layer.borderWidth = 5
                    btn28Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 29:
                    btn29Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn29Label.layer.borderWidth = 5
                    btn29Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 30:
                    btn30Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn30Label.layer.borderWidth = 5
                    btn30Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 31:
                    btn31Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn31Label.layer.borderWidth = 5
                    btn31Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 32:
                    btn32Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn32Label.layer.borderWidth = 5
                    btn32Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 33:
                    btn33Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn33Label.layer.borderWidth = 5
                    btn33Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 34:
                    btn34Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn34Label.layer.borderWidth = 5
                    btn34Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 35:
                    btn35Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn35Label.layer.borderWidth = 5
                    btn35Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 36:
                    btn36Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn36Label.layer.borderWidth = 5
                    btn36Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 37:
                    btn37Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn37Label.layer.borderWidth = 5
                    btn37Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 38:
                    btn38Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn38Label.layer.borderWidth = 5
                    btn38Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 39:
                    btn39Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn39Label.layer.borderWidth = 5
                    btn39Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                case 40:
                    btn40Label.layer.borderColor = BLUESTROKE?.cgColor
                    btn40Label.layer.borderWidth = 5
                    btn40Label.layer.cornerRadius = 10
                    btnbool[i-1] = true
                    btnbool2[i-1] = true
                    
                default:
                    break
                }
            }
        }
    }
    func setStart() {
        play()
    }

}
