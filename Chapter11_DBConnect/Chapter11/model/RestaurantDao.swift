//
//  RestuarantDao.swift
//  Chapter11
//
//  Created by UCOM-02 on 2022/11/11.
//

import Foundation


// Singleton
class RestaurantDAO: IGeneralDAO{
    // Data Fields
    var dbPath = ""
    
    // Singleton
    private static var _instance = RestaurantDAO()
    public static var shared: RestaurantDAO{
        return _instance
    }
    
    // Constructor
    private init(){
        dbPath = "\(NSHomeDirectory())/Documents/db.db"
        let fileMgr = FileManager.default
        if !fileMgr.fileExists(atPath: dbPath){
            if let srcPath = Bundle.main.path(forResource: "ch11db", ofType: "db"){
                try? fileMgr.copyItem(atPath: srcPath, toPath: dbPath)
            }
        }
    }
    
    // DB Settings
    let TABLE_NAME = "Restaurants"
    let COLUMN_RID = "rid"
    let COLUMN_NAME = "name"
    let COLUMN_ADDR = "addr"
    let COLUMN_PHOTO = "photo"
    
    // CRUD Method
    func getAll() -> [Restaurant] {
        var restaurants = [Restaurant]()
        if let db = FMDatabase(path: dbPath){
            db.open()
            let sql = "SELECT * FROM \(TABLE_NAME)"
            if let result = db.executeQuery(sql, withArgumentsIn: []){
                
                while result.next(){
                    let rid = Int(result.int(forColumn: COLUMN_RID))
                    let name = result.string(forColumn: COLUMN_NAME)!
                    let address = result.string(forColumn: COLUMN_ADDR)!
                    let photo = result.data(forColumn: COLUMN_PHOTO) ?? nil
                    
                    restaurants.append(Restaurant(rid:rid, name: name, address: address, photo: photo))
                }
                result.close()
            }
            db.close()
        }
        return restaurants
    }
    
    func getDataByID(id: Int) -> Restaurant? {
        var restaurant: Restaurant?
        if let db = FMDatabase(path: dbPath){
            db.open()
            let sql = "SELECT * FROM \(TABLE_NAME) where \(COLUMN_RID) = ?"
            if let result = db.executeQuery(sql, withArgumentsIn: [id]){
                
                if result.next(){
                    let rid = Int(result.int(forColumn: COLUMN_RID))
                    let name = result.string(forColumn: COLUMN_NAME)!
                    let address = result.string(forColumn: COLUMN_ADDR)!
                    let photo = result.data(forColumn: COLUMN_PHOTO) ?? nil
                    restaurant = Restaurant(rid: rid,name: name,address: address,photo: photo)
                }
                result.close()
            }
            db.close()
        }
        return restaurant
    }
    
    func delete(id: Int) -> Bool {
        var result = false
        if let db = FMDatabase(path: dbPath){
            db.open()
            
            let sql = "DELETE FROM \(TABLE_NAME) WHERE \(COLUMN_RID) = ?"
            result = db.executeUpdate(sql, withArgumentsIn: [id])
            db.close()
        }
        return result
    }
    
    func insert(data: Restaurant) -> Bool {
        let dict = toDict(data: data)
        
        let sql = "INSERT INTO \(TABLE_NAME) (\(COLUMN_NAME),\(COLUMN_ADDR),\(COLUMN_PHOTO)) VALUES (:n,:a,:p)"
        
        return updateDB(sql: sql, parameterDict: dict)
    }
    
    func update(data: Restaurant) -> Bool {
        let dict = toDict(data: data)
        
        let sql = "UPDATE \(TABLE_NAME) SET \(COLUMN_NAME)=:n,\(COLUMN_ADDR)=:a,\(COLUMN_PHOTO)=:p WHERE \(COLUMN_RID) = :r"
        
        return updateDB(sql: sql, parameterDict: dict)
    }
    
    private func updateDB(sql: String, parameterDict: [String:Any]) -> Bool{
        var result = false
        if let db = FMDatabase(path: dbPath){
            db.open()
            result = db.executeUpdate(sql, withParameterDictionary: parameterDict)
            db.close()
        }
        return result
    }
    
    private func toDict(data: Restaurant) -> [String:Any]{
        var dict = [String:Any]()
        dict["r"] = data.rid
        dict["n"] = data.name
        dict["a"] = data.address
        dict["p"] = data.photo
        return dict
    }
    
}
