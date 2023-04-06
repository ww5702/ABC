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
}
class NumberMemoryFirstViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    var timecount: Float = 2.5
    var currentTime: Float = 0.0
    
    // game end 된다면 초기화
    var level = 1.0
    
    weak var delegate: ContainerVCDelegatenumber?
    
    var timeEnd: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressView.progressViewStyle = .default
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .green
        progressView.trackTintColor = .lightGray
        progressView.progress = 0
        
        play()
        
    }

//    func setProgress(_ progress: Float, animated: Bool) {
//
//    }
    func play() {
        progressView.setProgress(currentTime, animated: true)
        perform(#selector(updateProgress), with: nil, afterDelay: 0.01)
        
        let max = pow(10, level)
        let randomnum = Int.random(in: 1...Int(max)-1)
        print(randomnum)
        
    }
    @objc func updateProgress() {
        currentTime += 0.01
        progressView.progress = currentTime/timecount
        if currentTime < timecount {
            perform(#selector(updateProgress), with: nil, afterDelay: 0.01)
        } else {
            timeEnd = true
            delegate?.didReceivedValueFromContainer(self, value: timeEnd)
        }
    }
    
    
    func setTimeEnd(_ value: Bool) {
        timeEnd = value
    }

}
