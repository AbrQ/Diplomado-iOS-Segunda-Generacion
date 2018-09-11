//
//  StaticCellViewController.swift
//  ToDoList
//
//  Created by Abraham Quezada on 04/09/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class StaticCellViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var isPickerDateHidden = true
    var todo: ToDo?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo{
            navigationItem.title = "To-Do"
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isComplete
            dueDatePicker.date = todo.dueDate
            notesTextView.text = todo.notes
        }else{
        dueDatePicker.date = Date().addingTimeInterval(24*60*60)
        }
        updateDueDateLabel(date: dueDatePicker.date)
        updateButtonSave()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch (indexPath) {
        case [0,1]: //Date Cell
            return isPickerDateHidden ? normalCellHeight : largeCellHeight
        case [0,2]: //Notes Cell
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath) {
        case [0,1]:
            isPickerDateHidden = !isPickerDateHidden
            tableView.deselectRow(at: indexPath, animated: true)
            dueDateLabel.textColor = isPickerDateHidden ? .black : tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else {
            return
        }
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePicker.date
        let notes = notesTextView.text
        
        todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }
    
    func updateDueDateLabel(date: Date){
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    func updateButtonSave(){
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateButtonSave()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
