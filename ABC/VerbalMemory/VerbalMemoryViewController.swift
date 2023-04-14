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
        shuffleArr = []
        saveArr = []
        wordcount = 0
        lifeLabel.text = "Life | \(life)"
        scoreLabel.text = "Score | \(score)"
        
        // txt 파일에서부터 단어 가져오기
        words = readTextFile().components(separatedBy: ",").dropLast()
        // 한번 랜덤으로 섞어준다
        words.shuffle()
        print(words)
        
        // 보여질 txt
        wordLabel.text = words[wordcount]
        checka = words[wordcount]
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
        if score < 1 {
            if check == true {
                score += 1
                scoreLabel.text = "Score | \(score)"
                
                print("save : \(saveArr)")
                print("shuffle : \(shuffleArr)")
                // 새로운 단어를 배열에 추가
                // 단 txt단어가 전부 들어가기전까지 추가
                if wordcount < words.count-1 {
                    wordcount += 1
                    print("ss\(wordcount)")
                    shuffleArr.append(words[wordcount])
                }
                // 셔플해서 새로운 단어 보여주기
                showword()
                
            } else {
                if life > 1 {
                    life -= 1
                    lifeLabel.text = "Life | \(life)"
                } else {
                    gotoResult()
                }
            }
        } else {
            if check == true {
                score += 1
                scoreLabel.text = "Score | \(score)"
                
                print("save : \(saveArr)")
                print("shuffle : \(shuffleArr)")
                // 새로운 단어를 배열에 추가
                // 단 txt단어가 전부 들어가기전까지 추가
                if wordcount < words.count-1 {
                    wordcount += 1
                    print("ss\(wordcount)")
                    shuffleArr.append(words[wordcount])
                }
                // 셔플해서 새로운 단어 보여주기
                showword()
                
            } else {
                if life > 1 {
                    life -= 1
                    lifeLabel.text = "Life | \(life)"
                    
                    // 셔플해서 중복되더라도 단어 보여주기
                    showword()
                } else {
                    gotoResult()
                }
                
            }
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
            print("save : \(saveArr)")
            print("shuffle : \(shuffleArr)")
            // 새로운 단어를 배열에 추가
            // 단 txt단어가 전부 들어가기전까지 추가
            if wordcount < words.count-1 {
                wordcount += 1
                print("s\(wordcount)")
                shuffleArr.append(words[wordcount])
            }
            // 새로 단어 하나를 추가한 배열을 셔플해서 중복된 단어일지라도 다시 보여주기
            showword()
        } else {
            if life > 1 {
                life -= 1
                lifeLabel.text = "Life | \(life)"
                
                // 셔플해서 중복되더라도 단어 보여주기
                showword()
            } else {
                gotoResult()
            }
        }
    }
    
    func showword() {
        shuffleArr.shuffle()
        print(shuffleArr)
        wordLabel.text = "\(shuffleArr.first!)"
        checka = "\(shuffleArr.first!)"
    }
    func gotoResult() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "VerbalMemoryScoreViewController") as? VerbalMemoryScoreViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.data = score
            self.present(vc, animated: true)
        }
    }
}
