//
//  ViewController.swift
//  WCFI-A
//
//  Created by Danzel Serrano on 11/14/20.
//

import UIKit

class AttendanceVC: UIViewController {
    
    @IBOutlet weak var AttendanceTable: UITableView!
    
    
    var data: [[String:Any]]!
    var attendanceData: [String:Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AttendanceTable.delegate = self
        AttendanceTable.dataSource = self
        
        data = WCFIBase.getData()
        attendanceData = WCFIBase.getAttendanceData()
        
        print(data!)
        print(attendanceData!)
    }
    
    @IBAction func backSegue(_ sender: UIButton) {
        performSegue(withIdentifier: "menu", sender: nil)
    }
    
}

extension AttendanceVC: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?
        if (cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = (data[indexPath.row]["fname"] as! String)
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        
        if(attendanceData[data[indexPath.row]["member_id"] as! String] == true){
            cell?.accessoryType = .checkmark
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if(cell?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
}

