//
//  DBHelper.swift
//  ABC
//
//  Created by 이재웅 on 2023/04/28.
//

import Foundation
import SQLite3

struct MyModel:Codable {
    var rank: Int?
    var id: Int
    var myName: String
    var section: Int?
    var forAim: Double?
}

struct MymyModel:Codable {
    var myName: String
    var section: Int?
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
               CREATE TABLE IF NOT EXISTS ABC_user(
               id INTEGER PRIMARY KEY AUTOINCREMENT,
               name TEXT DEFAULT 'no value',
               reaction INT DEFAULT '9999',
               verbal INT DEFAULT '0',
               visual INT DEFAULT '0',
               number INT DEFAULT '0',
               aim REAL DEFAULT '9999.0',
               chimp INT DEFAULT '0',
               sequence INT DEFAULT '0',
               password TEXT DEFAULT 'no value'
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
    func signUp(name : String, password: String) {
        let query = "insert into ABC_user (id, name, password) values (?, ?, ?);"
        print(query)
        var statement : OpaquePointer? = nil
        if sqlite3_prepare_v2(databasePointer, query, -1, &statement, nil) == SQLITE_OK {
            //insert는 read와 다르게 컬럼의 순서의 시작을 1 부터 한다.
            //따라서 id가 없기 때문에 2로 시작한다.
            sqlite3_bind_text(statement, 2, NSString(string: name).utf8String , -1, nil)
            sqlite3_bind_text(statement, 3, NSString(string: password).utf8String, -1, nil)
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Insert data SuccessFully : \(String(describing: databasePointer))")
                print("회원가입 성공")
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
    
    func insertData(name : String, value: Int, section: String){
        
        //autocrement일 경우에는 입력 부분에서는 컬럼을 추가 안해줘도 자동으로 추가가 되지만
        //쿼리 문에서는 이렇게 추가 해줘야합니다.
        let query = "insert into ABC_user (id, name, \(section)) values (?, ?, ?);"
        print(query)
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(databasePointer, query, -1, &statement, nil) == SQLITE_OK {
            //insert는 read와 다르게 컬럼의 순서의 시작을 1 부터 한다.
            //따라서 id가 없기 때문에 2로 시작한다.
            sqlite3_bind_text(statement, 2, NSString(string: name).utf8String , -1, nil)
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
    func insertDataForAim(name : String, value: Double, section: String){
        let query = "insert into ABC_user (id, name, \(section)) values (?, ?, ?);"
        print(query)
        var statement : OpaquePointer? = nil
        
        
        if sqlite3_prepare_v2(databasePointer, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 2, NSString(string: name).utf8String , -1, nil)
            sqlite3_bind_double(statement, 3, value)
            
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
    func updateDateForAim(name: String, value: Double, section: String) {
        var statement: OpaquePointer?
        let queryString = "UPDATE ABC_user SET \(section) = \(value) WHERE name == '\(name)'"
        print(queryString)
        
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            return
        }
        if sqlite3_step(statement) != SQLITE_DONE {
            return
        }
        print("Update has been successfully done")
        sqlite3_finalize(statement)
    }

    // 오류메시지 출력
    private func onSQLErrorPrintErrorMessage(_ db: OpaquePointer?) {
        let errorMessage = String(cString: sqlite3_errmsg(db))
        print("Error preparing update: \(errorMessage)")
        return
    }

    func updateDate(name: String, value: Int, section: String) {
        var statement: OpaquePointer?
        let queryString = "UPDATE ABC_user SET \(section) = \(Int32(value)) WHERE name == '\(name)'"
        print(queryString)
        
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

    func readData(section: String) -> [MyModel] {
        var statement: OpaquePointer?
        // 반응속도일때만 오름차순으로
        let queryString = "select * from ABC_user ORDER BY \(section) DESC;"
        var totalRank = 1
        
        var result: [MyModel] = []
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(databasePointer)!)
            print("error while prepare: \(errorMessage)")
            return result
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let id = sqlite3_column_int(statement, 0) // 결과의 0번째 테이블 값
            let name = String(cString: sqlite3_column_text(statement, 1)) // 결과의 1번째 테이블 값.
            let reaction = sqlite3_column_int(statement, 2)
            let verbal = sqlite3_column_int(statement, 3)
            let visual = sqlite3_column_int(statement, 4)
            let number = sqlite3_column_int(statement, 5)
            let aim = sqlite3_column_double(statement, 6)
            let chimp = sqlite3_column_int(statement, 7)
            let sequence = sqlite3_column_int(statement, 8)
            switch section {
            case "reaction":
                result.append(MyModel(rank: Int(totalRank), id: Int(id), myName: String(name), section: Int(reaction)))
                break
            case "verbal":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(verbal)))
                break
            case "visual":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(visual)))
                break
            case "number":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(number)))
                break
            case "aim":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(aim)))
                break
            case "chimp":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(chimp)))
                break
            case "sequence":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(sequence)))
                break
            default:
                break
            }
            totalRank += 1
        }
        sqlite3_finalize(statement)
        //print(result)
        return result
    }
    func readDataForAimReaction(section: String) -> [MyModel] {
        var statement: OpaquePointer?
        // 반응속도일때만 오름차순으로
        let queryString = "select * from ABC_user ORDER BY \(section);"
        var totalRank = 1
        
        var result: [MyModel] = []
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(databasePointer)!)
            print("error while prepare: \(errorMessage)")
            return result
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let id = sqlite3_column_int(statement, 0) // 결과의 0번째 테이블 값
            let name = String(cString: sqlite3_column_text(statement, 1)) // 결과의 1번째 테이블 값.
            let reaction = sqlite3_column_int(statement, 2)
            let verbal = sqlite3_column_int(statement, 3)
            let visual = sqlite3_column_int(statement, 4)
            let number = sqlite3_column_int(statement, 5)
            let aim = sqlite3_column_double(statement, 6)
            let chimp = sqlite3_column_int(statement, 7)
            let sequence = sqlite3_column_int(statement, 8)
            switch section {
            case "reaction":
                result.append(MyModel(rank: Int(totalRank), id: Int(id), myName: String(name), section: Int(reaction)))
                break
            case "verbal":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(verbal)))
                break
            case "visual":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(visual)))
                break
            case "number":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(number)))
                break
            case "aim":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(aim)))
                break
            case "chimp":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(chimp)))
                break
            case "sequence":
                result.append(MyModel(rank: Int(totalRank),id: Int(id), myName: String(name), section: Int(sequence)))
                break
            default:
                break
            }
            totalRank += 1
        }
        sqlite3_finalize(statement)
        //print(result)
        return result
    }
    func readMyData(name: String, section: String) -> [MymyModel] {
        var statement: OpaquePointer?
        // 반응속도일때만 오름차순으로
        let queryString = "SELECT \(section) FROM ABC_user WHERE name == '\(name)';"
        
        var result: [MymyModel] = []
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(databasePointer)!)
            print("error while prepare: \(errorMessage)")
            return result
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let value = sqlite3_column_int(statement, 0) // 결과의 0번째 값을 출력
            result.append(MymyModel(myName: String(name), section: Int(value)))
        }
        sqlite3_finalize(statement)
        
        return result
    }
    
    func readRecordData(name: String, section : String) -> Int {
        var statement: OpaquePointer?
        let queryString = "SELECT \(section) FROM ABC_user WHERE name == '\(name)';"
        print(queryString)
        var result: Int = 0
        
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(databasePointer)!)
            print("error while prepare: \(errorMessage)")
            return result
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let value = sqlite3_column_int(statement, 0) // 결과의 0번째 값을 출력
            result = Int(value)
        }
        sqlite3_finalize(statement)
        
        return result
    }
    func readRecordDataForAim(name: String, section : String) -> Double {
        var statement: OpaquePointer?
        let queryString = "SELECT \(section) FROM ABC_user WHERE name == '\(name)';"
        print(queryString)
        var result: Double = 0
        
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(databasePointer)!)
            print("error while prepare: \(errorMessage)")
            return result
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let value = sqlite3_column_double(statement, 0)
            result = value
        }
        sqlite3_finalize(statement)
        
        return result
    }
    func checkName(name: String) -> String {
        var statement: OpaquePointer?
        let queryString = "SELECT password FROM ABC_user WHERE name == '\(name)';"
        var result: String = ""
        
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(databasePointer)!)
            print("error while prepare: \(errorMessage)")
            return result
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let value = sqlite3_column_int(statement, 0)
            result = String(value)
        }
        sqlite3_finalize(statement)
        
        return result
    }
    
    func deleteTable(tableName: String) {
        let queryString = "DROP TABLE \(tableName)"
        var statement: OpaquePointer?
        
        if sqlite3_prepare(databasePointer, queryString, -1, &statement, nil) != SQLITE_OK {
            onSQLErrorPrintErrorMessage(databasePointer)
            return
        }
        
        // 쿼리 실행.
        if sqlite3_step(statement) != SQLITE_DONE {
            onSQLErrorPrintErrorMessage(databasePointer)
            return
        }
        
        print("drop table has been successfully done")
    }

    
}


