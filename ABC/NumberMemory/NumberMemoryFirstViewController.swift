//
//  NumberMemoryFirstViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/05.
//

import UIKit

class NumberMemoryFirstViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    var timecount: Float = 2.0
    var currentTime: Float = 0.0
    
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
    }
    @objc func updateProgress() {
        currentTime += 0.01
        progressView.progress = currentTime/timecount
        if currentTime < timecount {
            perform(#selector(updateProgress), with: nil, afterDelay: 0.01)
        } else {
            print("end")
        }
    }

}
