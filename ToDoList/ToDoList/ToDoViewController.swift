//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Max Steward on 30/01/2018.
//  Copyright © 2018 StewardStudios. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    var isEndDatePickerHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
        dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
        updateDueDateLabel(date: dueDatePickerView.date)
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    func updateSaveButtonState() {
        if titleTextField.text != "" {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePickerView.date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)

        switch(indexPath) {
        case[0,1]: //Due Date Cell
            return isEndDatePickerHidden ? normalCellHeight : largeCellHeight

        case[1,0]: //Notes Cell
            return largeCellHeight

        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(indexPath) {
        case[0,1]:
            isEndDatePickerHidden = !isEndDatePickerHidden
            
            dueDateLabel.textColor =
                isEndDatePickerHidden ? .black : tableView.tintColor
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
            
        default: break
        }
    }
}
