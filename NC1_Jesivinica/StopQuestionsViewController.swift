//
//  StopQuestionsViewController.swift
//  NC1_Jesivinica
//
//  Created by Jesivinica Santoso on 26/04/22.
//

import UIKit

class StopQuestionsViewController: UIViewController {
    
    var scheduleList = ["Belajar XCODE | 16.00","Interview Kandidat | 17.00","Studio Time | 20.00"]

    @IBOutlet weak var timerScheduleTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timerScheduleTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        timerScheduleTable.delegate=self
        timerScheduleTable.dataSource=self
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "setTimerForm", sender: nil)
    }
    
}
extension StopQuestionsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = scheduleList[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleList.count
    }
}
