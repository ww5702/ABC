//
//  DBHelper.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/28.
//

import Foundation
import SQLite3

struct MyModel:Codable {
    var id: Int
    var myName: String
    var myAge: Int?
}

class DBHelper {
    static let shared = DBHelper()
    
    static func getDatabasePointer(databaseName: String) -> OpaquePointer? {
        var databasePointer: OpaquePointer?
        
        let documentDatabasePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(databaseName).path
        
        if FileManager.default.fileExists(atPath: documentDatabasePath) {
            print("Database Exists (already)")
        } else {
            guard let bundleDatabasePath = Bundle.main.resourceURL?.appendingPathComponent(databaseName).path else {
                print("Unwrapping Error: Bundle Database Path doesn't exist")
                return nil
            }
            
            do {
                try FileManager.default.copyItem(atPath: bundleDatabasePath, toPath: documentDatabasePath)
                print("Database created (copied)")
            } catch {
                print("Error:\(error.localizedDescription)")
            }
        }
        
        if sqlite3_open(documentDatabasePath, &databasePointer) == SQLITE_OK {
            print("Successfully open database")
            print("Database path : \(documentDatabasePath)")
        } else {
            print("Could not open database")
        }
        
        return databasePointer
    }
    
    func createTable(){
        //AUTOINCREMENT를 사용하기 위해서는 INT 가 아니라 INTEGER을 사용해야 한다.
        let query = """
               CREATE TABLE IF NOT EXISTS test2(
               id INTEGER PRIMARY KEY AUTOINCREMENT,
               name TEXt NOT NULL,
               reaction INT DEFAULT 'no value',
               verbal INT DEFAULT 'no value',
               visual INT DEFAULT 'no value',
               number INT DEFAULT 'no value',
               aim INT DEFAULT 'no value',
               chimp INT DEFAULT 'no value',
               sequence INT DEFAULT 'no value'
               );
               """
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(databasePointer, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Create Table SuccessFully \(String(describing: databasePointer))")
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(databasePointer))
                print("\n Create Table step fail :  \(errorMessage)")
            }
        }
        else{
            let errorMessage = String(cString: sqlite3_errmsg(databasePointer))
            print("\n create Table sqlite3_prepare Fail ! :\(errorMessage)")
            
        }
        
        sqlite3_finalize(statement)
    }
    
    func insertData(name : String, value: Int, section: String){
        
        //autocrement일 경우에는 입력 부분에서는 컬럼을 추가 안해줘도 자동으로 추가가 되지만
        //쿼리 문에서는 이렇게 추가 해줘야합니다.
        let query = "insert into test2 (id, name, reaction) values (?, ?, ?);"
        
        var statement : OpaquePointer? = nil
        
        
        if sqlite3_prepare_v2(databasePointer, query, -1, &statement, nil) == SQLITE_OK {
            //insert는 read와 다르게 컬럼의 순서의 시작을 1 부터 한다.
            //따라서 id가 없기 때문에 2로 시작한다.
            sqlite3_bind_text(statement, 2, name , -1, nil)
            sqlite3_bind_int(statement, 3, Int32(value))
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Insert data SuccessFully : \(String(describing: databasePointer))")
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(databasePointer))
                print("\n insert Data sqlite3 step fail! : \(errorMessage)")
            }
        }
        else{
            let errorMessage = String(cString: sqlite3_errmsg(databasePointer))
            print("\n insert Data prepare fail! : \(errorMessage)")
        }
        
        sqlite3_finalize(statement)
        
    }

    // 오류메시지 출력
    private func onSQLErrorPrintErrorMessage(_ db: OpaquePointer?) {
        let errorMessage = String(cString: sqlite3_errmsg(db))
        print("Error preparing update: \(errorMessage)")
        return
    }

    func updateDate(id: Int, name: String, age: Int) {
        var statement: OpaquePointer?
        let queryString = "UPDATE myTable SET my_name = '\(name)', my_age = \(age) WHERE id == \(id)"
        
        // 쿼리 준비.
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            onSQLErrorPrintErrorMessage(databasePointer)
            return
        }
        // 쿼리 실행.
        if sqlite3_step(statement) != SQLITE_DONE {
            onSQLErrorPrintErrorMessage(databasePointer)
            return
        }
        
        print("Update has been successfully done")
        sqlite3_finalize(statement)
    }

    func readData() -> [MyModel] {
        var statement: OpaquePointer?
        let queryString = "select * from myTable;"
        
        var result: [MyModel] = []
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(databasePointer)!)
            print("error while prepare: \(errorMessage)")
            return result
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            
            let id = sqlite3_column_int(statement, 0) // 결과의 0번째 테이블 값
            let name = String(cString: sqlite3_column_text(statement, 1)) // 결과의 1번째 테이블 값.
            let age = sqlite3_column_int(statement, 2) // 결과의 2번째 테이블 값.
            
            result.append(MyModel(id: Int(id), myName: String(name), myAge: Int(age)))
        }
        sqlite3_finalize(statement)
        
        return result
    }

    
}


