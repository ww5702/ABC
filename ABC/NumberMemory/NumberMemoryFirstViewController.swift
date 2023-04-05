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
    override func viewDidLoad() {
        super.viewDidLoad()

        progressView.progressViewStyle = .default
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .green
        progressView.trackTintColor = .lightGray
        progressView.progress = 0
        // Do any additional setup after loading the view.
        progressView.setProgress(10, animated: true)
    }
    

    func setProgress(_ progress: Float, animated: Bool) {
        
    }
    

}
