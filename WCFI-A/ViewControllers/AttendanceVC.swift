//
//  ViewController.swift
//  WCFI-A
//
//  Created by Danzel Serrano on 11/14/20.
//

import UIKit

class AttendanceVC: UIViewController {
    
    @IBOutlet weak var AttendanceTable: UITableView!
    
    var data:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AttendanceTable.delegate = self
        AttendanceTable.dataSource = self
        
        data = []
        
        loadData()
    }
    
    func loadData(_ parameters: [String] = []){
        for i in 1...5 {
            data.append("yeer \(i)")
        }
    }
    
}

extension AttendanceVC: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?
        if (cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = data[indexPath.row]
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell!
    }
    
    
    
}

