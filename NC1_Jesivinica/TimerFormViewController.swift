//
//  TimerFormViewController.swift
//  NC1_Jesivinica
//
//  Created by Jesivinica Santoso on 28/04/22.
//

import UIKit

class TimerFormViewController: UIViewController {

    
    @IBOutlet weak var reminderTime: UIDatePicker!
    
    @IBOutlet weak var timerPeriod: UIDatePicker!
    
    @IBOutlet weak var timerDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
