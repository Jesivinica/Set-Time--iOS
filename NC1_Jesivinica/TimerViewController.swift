//
//  TimerViewController.swift
//  NC1_Jesivinica
//
//  Created by Jesivinica Santoso on 26/04/22.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController {

    
    @IBOutlet weak var timerDescription: UILabel!
    var receivedTimerDescriptionText: String?
    
    @IBOutlet weak var timerCountDown: UILabel!
    var receivedTimerPickerValue: Date = Date()
    
    @IBOutlet weak var timerProgressBar: UIProgressView!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var endButton: UIButton!
    
    var timer = Timer()
    var seconds: Int!
    var timerCounting:Bool = true
    var audioPlayer = AVAudioPlayer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "Alarm Clock", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch {
            //ERROR
        }
        
        calculateTime()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.timerClass), userInfo: nil, repeats: true)
   
        timerDescription.text = receivedTimerDescriptionText
        timerCountDown.text = timerString(time: TimeInterval(seconds))
        
    }

    @IBAction func pauseButtonPrssed(_ sender: Any) {
        timer.invalidate()
    
        if(timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            pauseButton.setTitle("Resume", for: .normal)
            pauseButton.setTitleColor(UIColor.orange, for: .normal)
           
            
            
        }
        else
        {
            timerCounting = true
            pauseButton.setTitle("Pause", for: .normal)
            pauseButton.setTitleColor(UIColor.black, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.timerClass), userInfo: nil, repeats: true)
        }
        
    }
    
    @IBAction func endButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
        audioPlayer.stop()
    }
    
    @objc func timerClass()
    {
        seconds -= 1
        timerCountDown.text = timerString(time: TimeInterval(seconds))
    
        if(seconds == 0)
        {
            timer.invalidate()
            audioPlayer.play()
            pauseButton.isHidden = true
        }
    }
    
    func timerString(time:TimeInterval) -> String
    {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)

    }
    
    
    func calculateTime ()
    {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: receivedTimerPickerValue)
        let minute = calendar.component(.minute, from: receivedTimerPickerValue)
        let seconds = (hour*3600)+(minute*60)
        self.seconds = seconds
        
    }
}
