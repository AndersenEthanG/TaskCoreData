//
//  TableViewCell.swift
//  TaskCoreData
//
//  Created by Ethan Andersen on 4/27/21.
//

import UIKit


protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}


class TaskTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    
    var task: Task? {
        didSet {
            updateView()
        }
    }
    
    weak var delegate: TaskCompletionDelegate?
    
    // MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        // What do you want to happen when this button is pressed?
        /// I want the little checkmark to light up
        /// I also want to run the update function in the Task Controller to toggle the isComplete
        // All of this needs to run through a delegated protocol
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    
    // MARK: - Functions
    
    func updateView() {
        guard let task = task else { return }
        // Update the outlets to look like the proper data
        taskNameLabel.text = task.name
        // Check if it is complete or not, to send the right picture
        if task.isComplete {
            completionButton.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            completionButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
} // End of Class
