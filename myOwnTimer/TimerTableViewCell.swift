//
//  TimerTableViewCell.swift
//  myOwnTimer
//
//  Created by Lincoln Nguyen on 2/14/21.
//

import UIKit

class TimerTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    
    // override func awakeFromNib() {
    //     super.awakeFromNib()
    //     // Initialization code
    // }

    // override func setSelected(_ selected: Bool, animated: Bool) {
    //     super.setSelected(selected, animated: animated)
    //
    //     // Configure the view for the selected state
    // }
    
    var timeSince: TimeSince? {
        didSet {
            // taskLabel.text = task?.name
            // setState()
            updateTime()
        }
    }
    
    // func updateState() {
    //     updateTime()
    // }
    
    
    func updateTime() {
        guard let timeSince = timeSince else {
            return
        }
    
        let time = Date().timeIntervalSince(timeSince.start)
    
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
    
        // var times: [String] = []
        // if hours > 0 {
        //     times.append("\(hours)h")
        // }
        // if minutes > 0 {
        //     times.append("\(minutes)m")
        // }
        // times.append("\(seconds)s")
        //
        // timeLabel.text = times.joined(separator: " ")
        
        if hours > 0 {
            timeLabel.text = "\(hours)h"
        } else if minutes > 0 {
            timeLabel.text = "\(minutes)m"
        } else if seconds > 0 {
            timeLabel.text = "\(seconds)s"
        }
    }
}
