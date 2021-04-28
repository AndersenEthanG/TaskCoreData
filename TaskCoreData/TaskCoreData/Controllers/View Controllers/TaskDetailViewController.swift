//
//  TaskDetailViewController.swift
//  TaskCoreData
//
//  Created by Ethan Andersen on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    
    // MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    
    var task: Task?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        // Make sure the fields are not empty using a Guard
        guard let name = taskNameTextField.text, !name.isEmpty else { return }
        // Declare the Data to be used - Use IF to decide if we should create or update
        if let task = task {
            // Update the data to the CoreData if it already exists
            TaskController.sharedInstance.updateTask(task: task, name: name, note: taskNotesTextView.text, dueDate: date)
        } else {
            // Else create a new bit of data
            TaskController.sharedInstance.createTask(name: name, note: taskNotesTextView.text, dueDate: date)
        }
        // Pop the view
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    func updateView() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.note
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
    
} // End of Class
