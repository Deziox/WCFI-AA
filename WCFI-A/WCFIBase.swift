//
//  DBFunctions.swift
//  WCFI-A
//
//  Created by Danzel Serrano on 11/14/20.
//

import Foundation
import Firebase

public class WCFIBase{
    
    public static let db = Firestore.firestore()
    
    public static var data:[[String:Any]]!
    
    public static var attendanceData:[String:Bool]!
    
    public static let date = Date()
    public static var year: Int!
    public static var month: Int!
    public static var day: Int!
    
    static let dateFormatter = DateFormatter()
    
    public static func initializeDB(){
        data = []
        attendanceData = [:]
        
        dateFormatter.dateFormat = "dd"
        day = Int(dateFormatter.string(from: date))
        dateFormatter.dateFormat = "MM"
        month = Int(dateFormatter.string(from: date))
        dateFormatter.dateFormat = "yyyy"
        year = Int(dateFormatter.string(from: date))
        
        print("Today's date: \(year ?? 0)-\(month ?? 0)-\(day ?? 0)")
        loadData()
    }
    
    public static func loadData(_ parameters: [String] = []){
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async{
            db.collection("MemberAttendance").getDocuments(){ (querySnapshot,err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                }else{
                    for document in querySnapshot!.documents {
                        //print("\(document.documentID) => \(document.data())")
                        
                        let temp = document.data()
                        
                        if((temp["aYear"] as! Int) == year &&
                            (temp["aMonth"] as! Int) == month &&
                            (temp["aDay"] as! Int) == day){
                            attendanceData[document.data()["member_id"] as! String] = true
                        }
                    }
                }
            }
            group.leave()
        }
        
        
        db.collection("Members").getDocuments(){ (querySnapshot,err) in
            if let err = err {
                print("Error getting documents: \(err)")
            }else{
                for document in querySnapshot!.documents {
                    //print("\(document.documentID) => \(document.data())")
                    var temp = document.data()
                    temp["member_id"] = document.documentID
                    data.append(temp)
                }
            }
        }
    }
    
    public static func getData() -> [[String:Any]]{
        return data
    }
    
    public static func getAttendanceData() -> [String:Bool]{
        return attendanceData
    }
    
    public static func pushToDB(){
        
    }
}
