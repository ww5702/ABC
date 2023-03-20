//
//  VerbalMemoryViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/20.
//

import UIKit

class VerbalMemoryViewController: UIViewController {
    
    
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    var checka : String = ""
    var words : [String] = []
    var shuffleArr : [String] = []
    var saveArr : [String] = []
    var score = 0
    var life = 3
    var wordcount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 시작과 동시에 목숨 밑 점수 초기화
        lifeLabel.text = "Life | \(life)"
        scoreLabel.text = "Score | \(score)"
        
        // txt 파일에서부터 단어 가져오기
        words = readTextFile().components(separatedBy: ",").dropLast()
        // 한번 랜덤으로 섞어준다
        words.shuffle()
        print(words)
        print(words.shuffled())
        
        // 보여질 txt
        wordLabel.text = words[0]
        checka = words[0]
    }
    
    
    // txt파일 불러오기
    func readTextFile() -> String {
        var result = ""
        
        guard let pahts = Bundle.main.path(forResource: "words.txt", ofType: nil) else {return ""}
        do {
            result = try String(contentsOfFile: pahts, encoding: .utf8)
            return result
        } catch {
            return "Error: file read failes - \(error.localizedDescription)"
        }
    }
    
    // 본적 있는 단어다
    @IBAction func seenBtn(_ sender: UIButton) {
        let check = saveArr.contains(checka)
        if check == true {
            score += 1
            scoreLabel.text = "Score | \(score)"
            
            // 셔플해서 새로운 단어 보여주기
            let random = saveArr.shuffled()
            wordLabel.text = "\(random)"
            checka = "\(random)"
            
        } else {
            life -= 1
            lifeLabel.text = "Life | \(life)"
            
            // 셔플해서 중복되더라도 단어 보여주기
            let random = shuffleArr.shuffled()
            wordLabel.text = "\(random)"
            checka = "\(random)"
        }
    }
    
    // 새로운 단어다
    @IBAction func newBtn(_ sender: UIButton) {
        let check = saveArr.contains(checka)
        if check == false {
            score += 1
            scoreLabel.text = "Score | \(score)"
            
            // 단어를 본 배열에 저장
            saveArr.append(checka)
            shuffleArr.append(checka)
            // 새로운 단어를 배열에 추가
            wordcount += 1
            shuffleArr.append(words[wordcount])
            // 셔플해서 중복된 단어일지라도 다시 보여주기
            let random = shuffleArr.shuffled()
            wordLabel.text = "\(random)"
            checka = "\(random)"
        } else {
            life -= 1
            lifeLabel.text = "Life | \(life)"
            
            // 셔플해서 중복되더라도 단어 보여주기
            let random = shuffleArr.shuffled()
            wordLabel.text = "\(random)"
            checka = "\(random)"
        }
    }
}
