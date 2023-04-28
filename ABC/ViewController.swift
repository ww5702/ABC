//
//  ViewController.swift
//  ABC
//
//  Created by 이재웅 on 2023/03/14.
//

import SQLite3
import Lottie
import UIKit

class ViewController: UIViewController {
    
    private var animationView: LottieAnimationView?
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.isHidden = true
        // Do any additional setup after loading the view.
        
        animationView = .init(name: "main")
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = CGPoint(x: self.view.frame.size.width/2, y: 300)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
        
//        let fileMgr = FileManager()
//        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let dbPath = docPathURL.appendingPathComponent("ABC").path
        
        
        let dbPath = self.getDBPath()
        dbExecute(dbPath: dbPath)
        print("dir=\n\(dbPath)")
    }
    
    
    /// 기존 DB가 없다면 템플릿의 주소 반환
    func getDBPath() -> String {
        let fileMgr = FileManager()
                let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
                let dbPath = docPathURL.appendingPathComponent("ABC").path
                
                /// 파일이 없다면 앱 번들에 만들어 놓은 db.sqlite가져와서 사용
                if fileMgr.fileExists(atPath: dbPath) == false {
                    let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")
                    try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath)
                }
                
                return dbPath
    }
    /// DB연결 ~ SQL실행 ~ DB연결종료
    func dbExecute(dbPath: String) {
        /// 필수로 필요한 객체 : 각각 DB와 연결할 객체와, 컴파일 된 SQL문을 담을 객체
        var db: OpaquePointer? = nil /// SQLite 연결 정보를 담을 객체
        guard sqlite3_open(dbPath, &db) == SQLITE_OK else {return}
        
        defer {
            print("Close DB Connection")
            sqlite3_close(db)
        }
        
        var stmt: OpaquePointer? = nil
        let sql = "INSERT INTO user (name) VALUES ('123')"
        guard sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK else {return}
        
        defer {
            print("Finalize Statement")
            sqlite3_finalize(stmt)
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE {print("Success insert")}
    }

    @IBAction func btnPlayGame(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "GameSelectViewController")
        // 전체 화면
        vcName?.modalPresentationStyle = .fullScreen
        // 전환 애니메이션
        vcName?.modalTransitionStyle = .crossDissolve
        self.present(vcName!, animated: true, completion: nil)
    }
    
}

