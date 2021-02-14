//
//  TimerTableViewController.swift
//  myOwnTimer
//
//  Created by Lincoln Nguyen on 2/14/21.
//

import UIKit
import SwiftDate

class TimerTableViewController: UITableViewController {
    @IBOutlet var timeTableView: UITableView!
    
    var timer: Timer?
    
    var timerList: [TimeSince] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAlertController))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timerList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        if let cell = cell as? TimerTableViewCell {
            cell.timeSince = timerList[indexPath.row]
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TimerTableViewController {
    @objc func presentAlertController(_ sender: UIBarButtonItem) {
        createTimer()
        
        let timer = TimeSince()
        
        print(timer.start)
        
        self.timerList.append(timer)
        
        let indexPath = IndexPath(row: self.timerList.count - 1, section: 0)
        
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: .top)
        self.tableView.endUpdates()
        
        // let test = DateInRegion()
        // print(test)
    }
    
    @objc func updateTimer() {
        guard let visibleRowsIndexPaths = tableView.indexPathsForVisibleRows else {
            return
        }
        for indexPath in visibleRowsIndexPaths {
            if let cell = timeTableView.cellForRow(at: indexPath) as? TimerTableViewCell {
                cell.updateTime()
            }
        }
    }
    
    func createTimer() {
        if timer == nil {
            let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats:true)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.1
            self.timer = timer
        }
    }
}
