//
//  NumberMemoryFirstViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/05.
//

import UIKit
import Foundation

protocol ContainerVCDelegatenumber: AnyObject {
    func didReceivedValueFromContainer(_ controller: NumberMemoryFirstViewController, value: Bool)
    func didReceivedValueFromContainerNum(_ controller: NumberMemoryFirstViewController, value: Int)
}
class NumberMemoryFirstViewController: UIViewController {

    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    var timecount: Float = 2.5
    var currentTime: Float = 0.0
    
    // game end 된다면 초기화
    var count = 1.0
    var randomnum : Int = 0
    
    weak var delegate: ContainerVCDelegatenumber?
    
    var timeEnd: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressView.progressViewStyle = .default
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .white
        progressView.trackTintColor = .systemBlue
        progressView.progress = 0
        
        explainLabel.text = "해당 숫자를 외우세요!"
        play()
        
    }

//    func setProgress(_ progress: Float, animated: Bool) {
//
//    }
    func play() {
        progressView.setProgress(currentTime, animated: true)
        perform(#selector(updateProgress), with: nil, afterDelay: 0.01)
        
        let max = pow(10, count)
        let min = pow(10, count-1)
        print(max,min)
        randomnum = Int.random(in: Int(min)...Int(max)-1)
        //print(randomnum)
        numberLabel.text = String(randomnum)
    }
    
    @objc func updateProgress() {
        currentTime += 0.01
        progressView.progress = currentTime/timecount
        if currentTime < timecount {
            perform(#selector(updateProgress), with: nil, afterDelay: 0.01)
        } else {
            timeEnd = true
            delegate?.didReceivedValueFromContainer(self, value: timeEnd)
            delegate?.didReceivedValueFromContainerNum(self, value: randomnum)
            
        }
    }
    
    
    func setTimeEnd(_ value: Bool) {
        timeEnd = value
    }
    func setgamego() {
        count += 1.0
        progressView.progress = 0
        currentTime = 0.0
        timeEnd = false
        play()
    }

}
