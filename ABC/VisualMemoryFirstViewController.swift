//
//  VisualMemoryFirstViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/28.
//

import UIKit

protocol ContainerVCDelegate: AnyObject {
    func didReceivedValueFromContainer(_ controller: VisualMemoryFirstViewController, value: String)
}

class VisualMemoryFirstViewController: UIViewController {
    
    @IBOutlet weak var btn1Label: UIButton!
    @IBOutlet weak var btn2Label: UIButton!
    @IBOutlet weak var btn3Label: UIButton!
    @IBOutlet weak var btn4Label: UIButton!
    @IBOutlet weak var btn5Label: UIButton!
    @IBOutlet weak var btn6Label: UIButton!
    @IBOutlet weak var btn7Label: UIButton!
    @IBOutlet weak var btn8Label: UIButton!
    @IBOutlet weak var btn9Label: UIButton!
    
    weak var delegate: ContainerVCDelegate?
    
    let WHITE = UIColor.white
    let BLUE = UIColor.systemBlue
    let savescore = "1"

    override func viewDidLoad() {
        setblue()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn1(_ sender: UIButton) {
        btn1Label.backgroundColor = WHITE
        print("1번 눌림")
        
        delegate?.didReceivedValueFromContainer(self, value: savescore )
        
    }
    @IBAction func btn2(_ sender: UIButton) {
    }
    @IBAction func btn3(_ sender: UIButton) {
    }
    @IBAction func btn4(_ sender: UIButton) {
    }
    @IBAction func btn5(_ sender: UIButton) {
    }
    @IBAction func btn6(_ sender: UIButton) {
    }
    @IBAction func btn7(_ sender: UIButton) {
    }
    @IBAction func btn8(_ sender: UIButton) {
    }
    @IBAction func btn9(_ sender: UIButton) {
        self.view.backgroundColor = WHITE
        print("9번 눌림")
    }
    
    func setblue() {
        btn1Label.backgroundColor = BLUE
        btn2Label.backgroundColor = BLUE
        btn3Label.backgroundColor = BLUE
        btn4Label.backgroundColor = BLUE
        btn5Label.backgroundColor = BLUE
        btn6Label.backgroundColor = BLUE
        btn7Label.backgroundColor = BLUE
        btn8Label.backgroundColor = BLUE
        btn9Label.backgroundColor = BLUE
    }

}
