//
//  ViewController.swift
//  NC1_Jesivinica
//
//  Created by Jesivinica Santoso on 26/04/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var setTimerPicker: UIDatePicker!
    var setTimerPickerValue : Date = Date()
    
    @IBOutlet weak var timerDescription: UITextField!
    var timerDescriptionText : String?
    
    
    @IBOutlet weak var startTimerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timerDescription.text = ""
    }

    @IBAction func setTimerPickerDone(_ sender: Any) {
    }
    
    
    @IBAction func timerDescriptionInsert(_ sender: Any) {
        
    }
    
    
    @IBAction func startButtonClicked(_ sender: Any) {
        timerDescriptionText = timerDescription.text
        setTimerPickerValue = setTimerPicker.date
        performSegue(withIdentifier: "redirectTimerPage", sender: nil)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var timerVC = segue.destination as! TimerViewController
        timerVC.receivedTimerDescriptionText = timerDescriptionText
        timerVC.receivedTimerPickerValue = setTimerPickerValue
    }
}

